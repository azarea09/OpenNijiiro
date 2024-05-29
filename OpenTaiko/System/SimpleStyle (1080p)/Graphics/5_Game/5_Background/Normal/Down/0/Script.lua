local CenterX = 1920 / 2
local CenterY = 1080 / 2
local bgClearOutFade = 0
local bgfever03_00Fade = 0
local bg01Fade = 60
local bg01Timer = 0
local isFever = false
local bgfever03Timer = 0
local bgfever03_01Fade = 0
local bg03fever_02Y = 10000
local bg03fever_03Y = 10000
local bg03fever_04Y = 10000
local bg03fever_05Y = 10000
local bg03fever_06Y = 10000
local bg03fever_07Y = 10000

--小判
local bgScrollY_Coin = -70.0
local bgScrollEndY_Coin = 2420.0
local bgScrollDistanceY_Coin = bgScrollEndY_Coin - bgScrollY_Coin
local bgScrollTime_Coin = 17.44 --移動にかかる時間（秒）
local bgTimer_Coin = 0.0

--波(大)
local bgScrollX_BigWave = 0.0
local bgScrollEndX_BigWave = -1920
local bgScrollDistanceX_BigWave = bgScrollEndX_BigWave - bgScrollX_BigWave
local bgScrollTime_BigWave = 21.33 --移動にかかる時間（秒）

function clearIn(player)
    isFever = false;
    bgClearOutFade = 255;
    bgfever03Timer = 0
    bgfever03_00Fade = 0;
    bgfever03_01Fade = 0;
    bg03fever_02Y = 10000
    bg03fever_03Y = 10000
    bg03fever_04Y = 10000
    bg03fever_05Y = 10000
    bg03fever_06Y = 10000
    bg03fever_07Y = 10000
end

function clearOut(player)
end

function init()
    func:AddGraph("bg_nomal_a_02_00.png");
    func:AddGraph("bg_nomal_a_02_01.png");
    --fever03
    func:AddGraph("bg_fever_a_03_00.png");
    func:AddGraph("bg_fever_a_03_01.png");
    func:AddGraph("bg_fever_a_03_02.png");
    func:AddGraph("bg_fever_a_03_03.png");
    func:AddGraph("bg_fever_a_03_04.png");
    func:AddGraph("bg_fever_a_03_05.png");
    func:AddGraph("bg_fever_a_03_06.png");
    func:AddGraph("bg_fever_a_03_07.png");
    func:AddGraph("bg_fever_a_03_08.png");
end

function update()
    if isClear[0] then
        bgFever03InAnime()
    else
        bgClearOutFade = bgClearOutFade - (600 * deltaTime); 
        bgfever03_00Fade = bgClearOutFade; 
        bgfever03_01Fade = bgClearOutFade; 
    end
    
    if bgClearOutFade > 255 then
        bgClearOutFade = 255;
    end
    if bgClearOutFade < 0 then
        bgClearOutFade = 0;
    end
    
    bg01FadeAnime()

    if isFever then
        --fever03
        --小判
        bgTimer_Coin = bgTimer_Coin + deltaTime
        bgScrollY_Coin = bgScrollY_Coin + ((bgScrollDistanceY_Coin / bgScrollTime_Coin) * deltaTime)
        if bgScrollY_Coin >= bgScrollEndY_Coin then
            bgScrollY_Coin = -70.0;
            bgTimer_Coin = 0.0;
        end

        --波(大)
        bgScrollX_BigWave = bgScrollX_BigWave + ((bgScrollDistanceX_BigWave / bgScrollTime_BigWave) * deltaTime)
        if bgScrollX_BigWave <= bgScrollEndX_BigWave then
            bgScrollX_BigWave = 0.0;
        end

        --緑の丸いやつ

    end
end

--点滅してるやつのモーション
function bg01FadeAnime()
    bg01Timer = bg01Timer + deltaTime

    if bg01Timer >= 0.66 then
        bg01Timer = 0;
    end

    if bg01Timer < 0.06 then
        local t = bg01Timer / 0.06
        bg01Fade = 60 + (70 - 60) * t
    end

    if bg01Timer >= 0.06 and bg01Timer < 0.31 then
        local t = (bg01Timer - 0.06) / (0.31 - 0.06)
        bg01Fade = 70 - (70 - 60) * t
    end

    if bg01Timer >= 0.31 and bg01Timer < 0.41 then
        local t = (bg01Timer - 0.31) / (0.41 - 0.31)
        bg01Fade = 60 + (70 - 60) * t
    end

    if bg01Timer >= 0.41 and bg01Timer < 0.48 then
        local t = (bg01Timer - 0.41) / (0.48 - 0.41)
        bg01Fade = 70 - (70 - 60) * t
    end

    if bg01Timer >= 0.48 and bg01Timer < 0.56 then
        local t = (bg01Timer - 0.48) / (0.56 - 0.48)
        bg01Fade = 60 + (70 - 60) * t
    end

    if bg01Timer >= 0.56 and bg01Timer < 0.66 then
        local t = (bg01Timer - 0.56) / (0.66 - 0.56)
        bg01Fade = 70 - (70 - 60) * t
    end
end

function drawBgCoinAnime()
    if isFever then
        if bgTimer_Coin < 0.65 then
            func:DrawGraphRectCenter(CenterX + -525, CenterY + bgScrollY_Coin + 92, 0, 183, 860, 232, "bg_fever_a_03_08.png");
        elseif bgTimer_Coin >= 0.65 then
            func:DrawGraphCenter(CenterX + -525, CenterY + bgScrollY_Coin, "bg_fever_a_03_08.png");
        end

        func:DrawGraphCenter(CenterX + -405, CenterY + bgScrollY_Coin + 489, "bg_fever_a_03_08.png");

        if bgTimer_Coin < 2.28 then
            func:DrawGraphRectCenter(CenterX + 523, CenterY + bgScrollY_Coin + -200 + 92, 0, 183, 860, 232, "bg_fever_a_03_08.png");
        elseif bgTimer_Coin >= 2.28 then
            func:DrawGraphCenter(CenterX + 523, CenterY + bgScrollY_Coin + -200, "bg_fever_a_03_08.png");
        end

        func:DrawGraphCenter(CenterX + 403, CenterY + bgScrollY_Coin + 289, "bg_fever_a_03_08.png");

        if bgTimer_Coin > 3.81 and bgTimer_Coin < 5.63 then
            func:DrawGraphRectCenter(CenterX + -405, CenterY + bgScrollY_Coin + -704 + 92, 0, 183, 860, 232, "bg_fever_a_03_08.png");
        elseif bgTimer_Coin >= 5.63 then
            func:DrawGraphCenter(CenterX + -405, CenterY + bgScrollY_Coin + -704, "bg_fever_a_03_08.png");
        end

        if bgTimer_Coin > 5.25 and bgTimer_Coin < 7.0 then
            func:DrawGraphRectCenter(CenterX + 403, CenterY + bgScrollY_Coin + -905 + 92, 0, 183, 860, 232, "bg_fever_a_03_08.png");
        elseif bgTimer_Coin >= 7.0 then
            func:DrawGraphCenter(CenterX + 403, CenterY + bgScrollY_Coin + -905, "bg_fever_a_03_08.png");
        end

        if bgTimer_Coin > 12.88 and bgTimer_Coin < 14.8 then
            func:DrawGraphRectCenter(CenterX + -405, CenterY + bgScrollY_Coin + -2003 + 92, 0, 183, 860, 232, "bg_fever_a_03_08.png");
        elseif bgTimer_Coin >= 14.8 then
            func:DrawGraphCenter(CenterX + -405, CenterY + bgScrollY_Coin + -2003, "bg_fever_a_03_08.png");
        end

        if bgTimer_Coin > 14.3 and bgTimer_Coin < 16.1 then
            func:DrawGraphRectCenter(CenterX + 403, CenterY + bgScrollY_Coin + -2204 + 92, 0, 183, 860, 232, "bg_fever_a_03_08.png");
        elseif bgTimer_Coin >= 16.1 then
            func:DrawGraphCenter(CenterX + 403, CenterY + bgScrollY_Coin + -2204, "bg_fever_a_03_08.png");
        end

        if bgTimer_Coin > 16.35 then
            func:DrawGraphRectCenter(CenterX + -525, CenterY + bgScrollY_Coin + -2491 + 92, 0, 183, 860, 232, "bg_fever_a_03_08.png");
        end

    end
end

--bgFever03
function bgFever03InAnime()
    bgfever03Timer = bgfever03Timer + deltaTime

    if bgfever03Timer >= 0.51 then
        bgfever03Timer = 0.51;
        isFever = true
    end

    --背景
    if bgfever03Timer >= 0.06 and bgfever03Timer < 0.16 then
        local t = (bgfever03Timer - 0.06) / (0.16 - 0.06)
        bgfever03_00Fade = 255 * t
    end

    --富士山
    if bgfever03Timer >= 0.28 and bgfever03Timer < 0.43 then
        local t = (bgfever03Timer - 0.28) / (0.43 - 0.28)
        bgfever03_01Fade = 255 * t
    end

    --緑の丸いやつ
    if bgfever03Timer < 0.016 then
        bg03fever_02Y = 657
    end

    if bgfever03Timer >= 0.016 and bgfever03Timer < 0.10 then
        local startY = 657
        local endY = 463
        local t = (bgfever03Timer - 0.01) / (0.10 - 0.01)
        bg03fever_02Y = startY + (endY - startY) * t
    end

    --波(大)
    if bgfever03Timer >= 0.13 and bgfever03Timer < 0.33 then
        local startY = 500
        local endY = 194
        local t = (bgfever03Timer - 0.13) / (0.33 - 0.13)
        bg03fever_03Y = startY + (endY - startY) * t
    end

    if bgfever03Timer >= 0.33 and bgfever03Timer < 0.45 then
        local startY = 200
        local endY = 235
        local t = (bgfever03Timer - 0.33) / (0.45 - 0.33)
        bg03fever_03Y = startY + (endY - startY) * t
    end

    --緑と黄色の波
    if bgfever03Timer >= 0.08 and bgfever03Timer < 0.18 then
        local startY = 574
        local endY = 454
        local t = (bgfever03Timer - 0.08) / (0.18 - 0.08)
        bg03fever_04Y = startY + (endY - startY) * t
    end
    if bgfever03Timer >= 0.18 and bgfever03Timer < 0.31 then
        local startY = 456
        local endY = 468
        local t = (bgfever03Timer - 0.18) / (0.31 - 0.18)
        bg03fever_04Y = startY + (endY - startY) * t
    end

    --波(小)
    if bgfever03Timer >= 0.10 and bgfever03Timer < 0.25 then
        local startY = 551
        local endY = 460
        local t = (bgfever03Timer - 0.10) / (0.25 - 0.10)
        bg03fever_05Y = startY + (endY - startY) * t
    end

    if bgfever03Timer >= 0.25 and bgfever03Timer < 0.35 then
        local startY = 460
        local endY = 494
        local t = (bgfever03Timer - 0.25) / (0.35 - 0.25)
        bg03fever_05Y = startY + (endY - startY) * t
    end

    --船（左）
    if bgfever03Timer >= 0.10 and bgfever03Timer < 0.33 then
        local startY = 568
        local endY = 323
        local t = (bgfever03Timer - 0.10) / (0.33 - 0.10)
        bg03fever_06Y = startY + (endY - startY) * t
    end

    if bgfever03Timer >= 0.33 and bgfever03Timer < 0.45 then
        local startY = 331
        local endY = 378
        local t = (bgfever03Timer - 0.33) / (0.45 - 0.33)
        bg03fever_06Y = startY + (endY - startY) * t
    end

    if bgfever03Timer >= 0.48 and bgfever03Timer < 0.51 then
        local startY = 386
        local endY = 394
        local t = (bgfever03Timer - 0.48) / (0.51 - 0.48)
        bg03fever_06Y = startY + (endY - startY) * t
    end

    --船（右）
    if bgfever03Timer >= 0.10 and bgfever03Timer < 0.33 then
        local startY = 598
        local endY = 251
        local t = (bgfever03Timer - 0.10) / (0.33 - 0.10)
        bg03fever_07Y = startY + (endY - startY) * t
    end

    if bgfever03Timer >= 0.33 and bgfever03Timer < 0.45 then
        local startY = 258
        local endY = 303
        local t = (bgfever03Timer - 0.33) / (0.45 - 0.33)
        bg03fever_07Y = startY + (endY - startY) * t
    end

    if bgfever03Timer >= 0.48 and bgfever03Timer < 0.51 then
        local startY = 303
        local endY = 318
        local t = (bgfever03Timer - 0.48) / (0.51 - 0.48)
        bg03fever_07Y = startY + (endY - startY) * t
    end
end

function draw()
    func:SetOpacity(255 * (bg01Fade / 100), "bg_nomal_a_02_01.png");
    
    func:DrawGraph(0, 540, "bg_nomal_a_02_00.png");
    func:SetBlendMode("Add", "bg_nomal_a_02_01.png");
    func:DrawGraph(0, 540, "bg_nomal_a_02_01.png");
    --func:DrawNum(500,100,bgTimer_Coin)
    
    --fever03
    func:SetOpacity(bgfever03_00Fade, "bg_fever_a_03_00.png");
    func:SetOpacity(bgfever03_01Fade, "bg_fever_a_03_01.png");
    func:SetOpacity(bgClearOutFade, "bg_fever_a_03_02.png");
    func:SetOpacity(bgClearOutFade, "bg_fever_a_03_03.png");
    func:SetOpacity(bgClearOutFade, "bg_fever_a_03_04.png");
    func:SetOpacity(bgClearOutFade, "bg_fever_a_03_05.png");
    func:SetOpacity(bgClearOutFade, "bg_fever_a_03_06.png");
    func:SetOpacity(bgClearOutFade, "bg_fever_a_03_07.png");
    func:SetOpacity(bgClearOutFade, "bg_fever_a_03_08.png");

    func:DrawGraph(0, 540, "bg_fever_a_03_00.png");
    func:DrawGraph(0, 536, "bg_fever_a_03_01.png");
    func:DrawGraphCenter(CenterX + bgScrollX_BigWave, CenterY + bg03fever_03Y, "bg_fever_a_03_03.png"); --波(大)
    func:DrawGraphCenter(CenterX + bgScrollX_BigWave + 1920, CenterY + bg03fever_03Y, "bg_fever_a_03_03.png"); --波(大)
    func:DrawGraphCenter(CenterX, CenterY + bg03fever_02Y, "bg_fever_a_03_02.png");
    drawBgCoinAnime() -- 小判
    func:DrawGraphCenter(CenterX + 709.0, CenterY + bg03fever_07Y, "bg_fever_a_03_07.png"); -- 船（右）
    func:DrawGraphCenter(CenterX, CenterY + bg03fever_04Y, "bg_fever_a_03_04.png"); 
    func:DrawGraphCenter(CenterX + -692.0, CenterY + bg03fever_06Y, "bg_fever_a_03_06.png"); -- 船（左）
    func:DrawGraphCenter(CenterX, CenterY + bg03fever_05Y, "bg_fever_a_03_05.png");

end
