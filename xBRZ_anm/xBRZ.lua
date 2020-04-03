local ffi = require("ffi")
ffi.cdef[[
struct ScalerCfg
{
  double luminanceWeight;
  double equalColorTolerance;
  double centerDirectionBias;
  double dominantDirectionThreshold;
  double steepDirectionThreshold;
  double newTestAttribute;
};

void scale(size_t factor, const uint32_t* src, uint32_t * trg, int srcWidth, int srcHeight,
    int colFmt, const struct ScalerCfg&, int yFirst, int yLast);

void bilinearScale(const uint32_t * src, int srcWidth, int srcHeight,
    uint32_t * trg, int trgWidth, int trgHeight);
void nearestNeighborScale(const uint32_t * src, int srcWidth, int srcHeight,
    uint32_t * trg, int trgWidth, int trgHeight);
]]

if xBRZ == nil then
  local CPATH = {}
  local cpath = package.cpath .. ";"
  local n
  while(1)do
    n = cpath:find(";")
    if n then
      CPATH[#CPATH + 1] = cpath:sub(1, n - 1)
      cpath = cpath:sub(n + 1, #cpath)
    else
      break
    end
  end
  if not CPATH[2]:find("script\\?.dll") then
    CPATH[3] = CPATH[2]:sub(1, CPATH[2]:find("\\script\\")) .. "script\\?.dll"
    package.cpath = package.cpath .. ";" .. CPATH[3]
  end
  for i = 1, #CPATH do
    local f = io.open(CPATH[i]:gsub("?", "xBRZ"), "rb")
    if f then
      xBRZ = ffi.load(CPATH[i]:gsub("?", "xBRZ"))
      f:close()
      break
    end
  end
end

local function scale(obj, usebuf, limitter)
  local max_x, max_y = obj.getinfo("image_max")
  local fobj, fw, fh = obj.getpixeldata("alloc")

  local factor = obj.track0
  local colorfmt = 1

  if usebuf then
    colorfmt = 1
  else
    colorfmt = 2
  end

  if (max_x >= fw * factor) and (max_y >= fh * factor) or not limitter then
    obj.setoption("drawtarget", "tempbuffer", fw*factor, fh*factor)
    obj.load("tempbuffer")

    local tobj, tw, th = obj.getpixeldata()

    local cfg = ffi.new("struct ScalerCfg", {1, 30, 4, 3.6, 2.2, 0})

    xBRZ.scale(factor, fobj, tobj, fw, fh, colorfmt, cfg, 0, 2147483647)

    obj.putpixeldata(tobj)
  end
end

local module_table = {
  scale = scale
}

return module_table
