local CenterX = 1920 / 2
local CenterY = 1080 / 2
local bgScrollX_01 = -492.0
local bgScrollEndX_01 = -1469.0
local bgScrollDistance_01 = bgScrollEndX_01 - bgScrollX_01
local bg_ScrollTime_01 = 10.66 --移動にかかる時間（秒）

function drawBg_01()
    func:DrawGraphCenter(CenterX + bgScrollX_01, CenterY + -383, "donbg_a_06_1p_01.png")
    func:DrawGraphCenter(CenterX + bgScrollX_01 + 980.0, CenterY + -383, "donbg_a_06_1p_01.png")
    func:DrawGraphCenter(CenterX + bgScrollX_01 + 1959.0, CenterY + -383, "donbg_a_06_1p_01.png")
end

function clearIn(player)
end

function clearOut(player)
end

function init()
    func:AddGraph("donbg_a_06_1p_01.png")
end

function update()
    bgScrollX_01 = bgScrollX_01 + ((bgScrollDistance_01 / bg_ScrollTime_01) * deltaTime)
    -- もし目標位置に達したら初期位置に戻す
    if bgScrollX_01 < bgScrollEndX_01 then
        bgScrollX_01 = -492.0;
    end
end

function draw()
    drawBg_01()
end
