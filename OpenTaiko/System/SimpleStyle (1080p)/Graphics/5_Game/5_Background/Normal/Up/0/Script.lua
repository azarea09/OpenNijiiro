local CenterX = 1920 / 2
local CenterY = 1080 / 2
local clearOpacity = { 0, 0 }

local bgScrollX_00 = 0
local bgScrollEndX_00 = -980.0
local bgScrollDistanceX_00 = bgScrollEndX_00 - bgScrollX_00
local bgScrollTime_00 = 10.7 --移動にかかる時間（秒）

local bgScrollY_01 = 20.0
local bgScrollEndY_01 = -14.0
local bgScrollDistanceY_01 = bgScrollY_01 - bgScrollEndY_01
local bgScrollTime_01 = 1.0 --移動にかかる時間（秒）

local bgScrollX_03 = 369.0
local bgScrollEndX_03 = -400.0
local bgScrollDistanceX_03 = bgScrollEndX_03 - bgScrollX_03
local bgScrollY_03 = -645.0
local bgScrollEndY_03 = -156.0
local bgScrollDistanceY_03 = bgScrollEndY_03 - bgScrollY_03
local bgScrollTime_03 = 2.65 --移動にかかる時間（秒）

function drawBg00()
    if p1IsBlue == false then
        func:DrawGraphCenter(CenterX + bgScrollX_00 + -1073.0, CenterY + -402.0, "donbg_a_06_1p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + -583.0, CenterY + -402.0, "donbg_a_06_1p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + -93.0, CenterY + -402.0, "donbg_a_06_1p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 397.0, CenterY + -402.0, "donbg_a_06_1p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 887.0, CenterY + -402.0, "donbg_a_06_1p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 1377.0, CenterY + -402.0, "donbg_a_06_1p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 1867.0, CenterY + -402.0, "donbg_a_06_1p_00.png")
    else
        func:DrawGraphCenter(CenterX + bgScrollX_00 + -1073.0, CenterY + -402.0, "donbg_a_06_2p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + -583.0, CenterY + -402.0, "donbg_a_06_2p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + -93.0, CenterY + -402.0, "donbg_a_06_2p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 397.0, CenterY + -402.0, "donbg_a_06_2p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 887.0, CenterY + -402.0, "donbg_a_06_2p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 1377.0, CenterY + -402.0, "donbg_a_06_2p_00.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 1867.0, CenterY + -402.0, "donbg_a_06_2p_00.png")
    end
end

function drawBg00Clear()
    func:DrawGraphCenter(CenterX + bgScrollX_00 + -1073.0, CenterY + -402.0, "donbg_a_06_1p_00_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + -583.0, CenterY + -402.0, "donbg_a_06_1p_00_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + -93.0, CenterY + -402.0, "donbg_a_06_1p_00_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + 397.0, CenterY + -402.0, "donbg_a_06_1p_00_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + 887.0, CenterY + -402.0, "donbg_a_06_1p_00_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + 1377.0, CenterY + -402.0, "donbg_a_06_1p_00_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + 1867.0, CenterY + -402.0, "donbg_a_06_1p_00_clear.png")
end

function drawBg03()
    if p1IsBlue == false then
        func:DrawGraphCenter(CenterX + bgScrollX_03, CenterY + bgScrollY_03, "donbg_a_06_1p_03.png")
        func:DrawGraphCenter(CenterX + bgScrollX_03 + -977.0, CenterY + bgScrollY_03 + -1.0, "donbg_a_06_1p_03.png")
        func:DrawGraphCenter(CenterX + bgScrollX_03 + 982.0, CenterY + bgScrollY_03 + -1.0, "donbg_a_06_1p_03.png")
    else
        func:DrawGraphCenter(CenterX + bgScrollX_03, CenterY + bgScrollY_03, "donbg_a_06_2p_03.png")
        func:DrawGraphCenter(CenterX + bgScrollX_03 + -977.0, CenterY + bgScrollY_03 + -1.0, "donbg_a_06_2p_03.png")
        func:DrawGraphCenter(CenterX + bgScrollX_03 + 982.0, CenterY + bgScrollY_03 + -1.0, "donbg_a_06_2p_03.png")
    end
end

function drawBg03Clear()
    func:DrawGraphCenter(CenterX + bgScrollX_03, CenterY + bgScrollY_03, "donbg_a_06_1p_03_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_03 + -977.0, CenterY + bgScrollY_03 + -1.0, "donbg_a_06_1p_03_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_03 + 982.0, CenterY + bgScrollY_03 + -1.0, "donbg_a_06_1p_03_clear.png")
end

function drawBg01()
    if p1IsBlue == false then
        func:DrawGraphCenter(CenterX + bgScrollX_00 + -821.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_01.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + -348.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_02.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 159.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_01.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 632.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_02.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 1139.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_01.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 1612.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_02.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 2119.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_01.png")
    else
        func:DrawGraphCenter(CenterX + bgScrollX_00 + -821.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_2p_01.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + -348.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_2p_02.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 159.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_2p_01.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 632.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_2p_02.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 1139.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_2p_01.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 1612.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_2p_02.png")
        func:DrawGraphCenter(CenterX + bgScrollX_00 + 2119.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_2p_01.png")
    end
end

function drawBg01Clear()
    func:DrawGraphCenter(CenterX + bgScrollX_00 + -821.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_01_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + -348.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_02_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + 159.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_01_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + 632.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_02_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + 1139.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_01_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + 1612.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_02_clear.png")
    func:DrawGraphCenter(CenterX + bgScrollX_00 + 2119.0, CenterY + bgScrollY_01 + -402.0, "donbg_a_06_1p_01_clear.png")
end

function clearIn(player)
end

function clearOut(player)
end

function init()
    func:AddGraph("donbg_a_06_1p_00.png")
    func:AddGraph("donbg_a_06_1p_01.png")
    func:AddGraph("donbg_a_06_1p_02.png")
    func:AddGraph("donbg_a_06_1p_03.png")
    func:AddGraph("donbg_a_06_1p_00_clear.png")
    func:AddGraph("donbg_a_06_1p_01_clear.png")
    func:AddGraph("donbg_a_06_1p_02_clear.png")
    func:AddGraph("donbg_a_06_1p_03_clear.png")
    func:AddGraph("donbg_a_06_2p_00.png")
    func:AddGraph("donbg_a_06_2p_01.png")
    func:AddGraph("donbg_a_06_2p_02.png")
    func:AddGraph("donbg_a_06_2p_03.png")
end

function update()
    bgScrollX_00 = bgScrollX_00 + ((bgScrollDistanceX_00 / bgScrollTime_00) * deltaTime)
    -- 目標位置に達したら初期位置に戻す
    if bgScrollX_00 <= bgScrollEndX_00 then
        bgScrollX_00 = 0.0;
    end
    
    local linearSpeedY = bgScrollDistanceY_01 / bgScrollTime_01  -- Y軸方向の一定速度
    if bgScrollY_01 ~= bgScrollEndY_01 then
        if bgScrollY_01 > bgScrollEndY_01 then
            bgScrollY_01 = math.max(bgScrollEndY_01, bgScrollY_01 - linearSpeedY * deltaTime)
        elseif bgScrollY_01 < bgScrollEndY_01 then
            bgScrollY_01 = math.min(bgScrollEndY_01, bgScrollY_01 + linearSpeedY * deltaTime)
        end
    else
        -- 目標位置に到達したら逆方向に動かす
        bgScrollEndY_01 = -bgScrollEndY_01
    end

    bgScrollX_03 = bgScrollX_03 + ((bgScrollDistanceX_03 / bgScrollTime_03) * deltaTime)
    if bgScrollX_03 <= bgScrollEndX_03 then
        bgScrollX_03 = 369.0;
    end
    bgScrollY_03 = bgScrollY_03 + ((bgScrollDistanceY_03 / bgScrollTime_03) * deltaTime)
    if bgScrollY_03 >= bgScrollEndY_03 then
        bgScrollY_03 = -645.0;
    end

    for player = 1, playerCount do
        if isClear[player - 1] then 
            clearOpacity[player] = math.min(clearOpacity[player] + (600 * deltaTime), 255)
        else 
            clearOpacity[player] = math.max(clearOpacity[player] - (600 * deltaTime), 0)
        end
    end
end

function draw()
    for player = 1, playerCount do
        drawBg00()  
        drawBg03()
        drawBg01()

        func:SetOpacity(clearOpacity[player], "donbg_a_06_1p_00_clear.png")
        drawBg00Clear()
        func:SetOpacity(clearOpacity[player], "donbg_a_06_1p_03_clear.png")
        drawBg03Clear()
        func:SetOpacity(clearOpacity[player], "donbg_a_06_1p_01_clear.png")
        func:SetOpacity(clearOpacity[player], "donbg_a_06_1p_02_clear.png")
        drawBg01Clear()
        --func:DrawNum(50,0,bgScrollX_00)
    end
end
