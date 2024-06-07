using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Runtime.InteropServices;
using FDK;
using System.Numerics;

namespace TJAPlayer3
{
    internal class FlyingNotes : CActivity
    {
        // コンストラクタ

        public FlyingNotes()
        {
            base.IsDeActivated = true;
        }


        // メソッド
        public virtual void Start(int nLane, int nPlayer, bool isRoll = false)
        {
            if (TJAPlayer3.ConfigIni.nPlayerCount > 2 || TJAPlayer3.ConfigIni.SimpleMode) return;
            EGameType _gt = TJAPlayer3.ConfigIni.nGameType[TJAPlayer3.GetActualPlayer(nPlayer)];

            if (TJAPlayer3.Tx.Notes[(int)_gt] != null)
            {
                for (int i = 0; i < 128; i++)
                {
                    if (!Flying[i].IsUsing)
                    {
                        // 初期化
                        Flying[i].IsUsing = true;
                        Flying[i].Lane = nLane;
                        Flying[i].Player = nPlayer;
                        if (TJAPlayer3.Skin.Game_Effect_FlyingNotes_IsNijiiroStyle)
                        {
                            Flying[i].X = 639;
                            Flying[i].Y = 342;
                        }
                        else
                        {
                            Flying[i].X = TJAPlayer3.Skin.Game_Effect_FlyingNotes_StartPoint_X[Flying[i].Player];
                            Flying[i].Y = TJAPlayer3.Skin.Game_Effect_FlyingNotes_StartPoint_Y[Flying[i].Player];
                        }
                        Flying[i].StartPointX = StartPointX[nPlayer];
                        Flying[i].StartPointY = TJAPlayer3.Skin.Game_Effect_FlyingNotes_StartPoint_Y[nPlayer];
                        Flying[i].IsRoll = isRoll;
                        // 角度の決定
                        Flying[i].Height = Math.Abs(TJAPlayer3.Skin.Game_Effect_FlyingNotes_EndPoint_Y[nPlayer] - TJAPlayer3.Skin.Game_Effect_FlyingNotes_StartPoint_Y[nPlayer]);
                        Flying[i].Width = (Math.Abs((TJAPlayer3.Skin.Game_Effect_FlyingNotes_EndPoint_X[nPlayer] - StartPointX[nPlayer])) / 2);
                        //Console.WriteLine("{0}, {1}", width2P, height2P);
                        Flying[i].Theta = ((Math.Atan2(Flying[i].Height, Flying[i].Width) * 180.0) / Math.PI);
                        Flying[i].Counter = new CCounter(0, 29, TJAPlayer3.Skin.Game_Effect_FlyingNotes_Timer, TJAPlayer3.Timer);
                        //Flying[i].Counter = new CCounter(0, 200000, CDTXMania.Skin.Game_Effect_FlyingNotes_Timer, CDTXMania.Timer);

                        Flying[i].IncreaseX = (1.00 * Math.Abs((TJAPlayer3.Skin.Game_Effect_FlyingNotes_EndPoint_X[nPlayer] - StartPointX[nPlayer]))) / (180);
                        Flying[i].IncreaseY = (1.00 * Math.Abs((TJAPlayer3.Skin.Game_Effect_FlyingNotes_EndPoint_Y[nPlayer] - TJAPlayer3.Skin.Game_Effect_FlyingNotes_StartPoint_Y[nPlayer]))) / (180);

                        Flying[i].FireWorksPoints = CalculateBezierPoints(i, 11);
                        Flying[i].LastPointIndexPassed = -1;

                        break;
                    }
                }
            }
        }

        // CActivity 実装

        public override void Activate()
        {
            for (int i = 0; i < 128; i++)
            {
                Flying[i] = new Status();
                Flying[i].IsUsing = false;
                Flying[i].Counter = new CCounter();
            }
            for (int i = 0; i < 2; i++)
            {
                StartPointX[i] = TJAPlayer3.Skin.Game_Effect_FlyingNotes_StartPoint_X[i];
            }
            base.Activate();
        }
        public override void DeActivate()
        {
            for (int i = 0; i < 128; i++)
            {
                Flying[i].Counter = null;
            }
            base.DeActivate();
        }
        public override void CreateManagedResource()
        {
            base.CreateManagedResource();
        }
        public override void ReleaseManagedResource()
        {
            base.ReleaseManagedResource();
        }

        #region ベジエ曲線

        // ベジエ曲線上の位置を計算する関数
        Vector2 CalculateBezier(double t, int i)
        {
            double x = CalculateBezierX(t, i);
            double y = CalculateBezierY(t, i);
            return new Vector2((float)x, (float)y);
        }

        // ベジエ曲線の長さを近似計算する関数
        double ApproximateBezierLength(int i, int segments = 100)
        {
            double length = 0;
            Vector2 previous = CalculateBezier(0, i);
            for (int j = 1; j <= segments; j++)
            {
                double t = (double)j / segments;
                Vector2 current = CalculateBezier(t, i);
                length += Vector2.Distance(previous, current);
                previous = current;
            }
            return length;
        }

        // 指定した距離に対応するt値を計算する関数
        double GetTForDistance(double distance, double totalLength, int i, int segments = 100)
        {
            double accumulatedLength = 0;
            Vector2 previous = CalculateBezier(0, i);
            for (int j = 1; j <= segments; j++)
            {
                double t = (double)j / segments;
                Vector2 current = CalculateBezier(t, i);
                double segmentLength = Vector2.Distance(previous, current);
                accumulatedLength += segmentLength;
                if (accumulatedLength >= distance)
                {
                    return t;
                }
                previous = current;
            }
            return 1; // 距離が総長を超えた場合、t = 1 を返す
        }

        double CalculateBezierX(double t, int i)
        {
            double p0 = TJAPlayer3.Skin.Game_Effect_FlyingNotes_StartPoint_X[Flying[i].Player];
            double p1 = TJAPlayer3.Skin.Game_Effect_FlyingNotes_ControlPoint1_X[Flying[i].Player]; // 制御点1
            double p2 = TJAPlayer3.Skin.Game_Effect_FlyingNotes_ControlPoint2_X[Flying[i].Player]; // 制御点2
            double p3 = TJAPlayer3.Skin.Game_Effect_FlyingNotes_EndPoint_X[Flying[i].Player]; ;
            return p0 * Math.Pow(1 - t, 3) + 3 * p1 * t * Math.Pow(1 - t, 2) + 3 * p2 * Math.Pow(t, 2) * (1 - t) + p3 * Math.Pow(t, 3);
        }

        double CalculateBezierY(double t, int i)
        {
            // サイトの座標は右下0,0 参考 https://www.desmos.com/calculator/csgnrh6t1b
            double q0 = TJAPlayer3.Skin.Game_Effect_FlyingNotes_StartPoint_Y[Flying[i].Player];
            double q1 = TJAPlayer3.Skin.Game_Effect_FlyingNotes_ControlPoint1_Y[Flying[i].Player]; // 制御点1
            double q2 = TJAPlayer3.Skin.Game_Effect_FlyingNotes_ControlPoint2_Y[Flying[i].Player]; // 制御点2
            double q3 = TJAPlayer3.Skin.Game_Effect_FlyingNotes_EndPoint_Y[Flying[i].Player];
            return q0 * Math.Pow(1 - t, 3) + 3 * q1 * t * Math.Pow(1 - t, 2) + 3 * q2 * Math.Pow(t, 2) * (1 - t) + q3 * Math.Pow(t, 3);
        }

        double EaseOut(double t)
        {
            return 1.0 - Math.Pow(1 - t, 1.0);
        }

        #endregion

        // ニジイロ風の座標
        private static Vector2[][] flyingPos = new Vector2[][]
        {
            new Vector2[] // 1Pの座標
            {
                new Vector2(639, 342),
                new Vector2(664, 300),
                new Vector2(693, 260),
                new Vector2(724, 223),
                new Vector2(757, 187),
                new Vector2(792, 153),
                new Vector2(830, 122),
                new Vector2(869, 93),
                new Vector2(910, 67),
                new Vector2(953, 44),
                new Vector2(997, 24),
                new Vector2(1043, 8),
                new Vector2(1090, -6),
                new Vector2(1138, -16),
                new Vector2(1187, -23),
                new Vector2(1236, -26),
                new Vector2(1285, -27),
                new Vector2(1333, -25),
                new Vector2(1381, -19),
                new Vector2(1429, -11),
                new Vector2(1476, 1),
                new Vector2(1523, 17),
                new Vector2(1568, 35),
                new Vector2(1612, 57),
                new Vector2(1654, 82),
                new Vector2(1694, 110),
                new Vector2(1732, 141),
                new Vector2(1768, 174),
                new Vector2(1802, 209),
                new Vector2(1834, 246)
            },
            new Vector2[] // 2Pの座標
            {
                new Vector2(637, 695),
                new Vector2(662, 737),
                new Vector2(688, 780),
                new Vector2(718, 819),
                new Vector2(750, 856),
                new Vector2(785, 891),
                new Vector2(821, 924),
                new Vector2(859, 954),
                new Vector2(899, 982),
                new Vector2(941, 1007),
                new Vector2(985, 1029),
                new Vector2(1031, 1048),
                new Vector2(1078, 1063),
                new Vector2(1126, 1075),
                new Vector2(1174, 1084),
                new Vector2(1222, 1089),
                new Vector2(1273, 1092),
                new Vector2(1320, 1092),
                new Vector2(1370, 1087),
                new Vector2(1418, 1080),
                new Vector2(1466, 1070),
                new Vector2(1514, 1055),
                new Vector2(1561, 1038),
                new Vector2(1605, 1017),
                new Vector2(1648, 993),
                new Vector2(1689, 967),
                new Vector2(1728, 937),
                new Vector2(1766, 905),
                new Vector2(1801, 870),
                new Vector2(1834, 833)
            }
        };

        public override int Draw()
        {
            if (!base.IsDeActivated && !TJAPlayer3.ConfigIni.SimpleMode)
            {
                // 最新のチップを16こだけソート
                var sortedFlying = Flying
                .Where(f => f.IsUsing)
                .OrderBy(f => f.Counter.CurrentValue)
                .Take(16)
                .ToList();

                //TJAPlayer3.act文字コンソール.tPrint(200, 20, C文字コンソール.Eフォント種別.白細, sortedFlying.Count.ToString());

                //sortedFlying.Reverse();

                // チップフラッシュ
                foreach (var flyingNote in sortedFlying)
                {
                    if (flyingNote.IsUsing)
                    {
                        if (flyingNote.Counter.IsEnded)
                        {
                            TJAPlayer3.stage演奏ドラム画面.actGauge.Start(flyingNote.Lane, ENoteJudge.Perfect, flyingNote.Player);
                            TJAPlayer3.stage演奏ドラム画面.actChipEffects.Start(flyingNote.Player, flyingNote.Lane);
                        }
                    }
                }

                for (int i = 0; i < 128; i++)
                {
                    if (Flying[i].IsUsing)
                    {
                        if (Flying[i].Counter.IsEnded)
                        {
                            Flying[i].Counter.Stop();
                            Flying[i].IsUsing = false;
                        }
                    }
                }

                for (int i = 0; i < 128; i++)
                {
                    if (Flying[i].IsUsing)
                    {
                        // Flyingの更新処理
                        Flying[i].Counter.Tick();

                        if(TJAPlayer3.Skin.Game_Effect_FlyingNotes_IsNijiiroStyle)
                        {
                            Flying[i].X = flyingPos[Flying[i].Player][Flying[i].Counter.CurrentValue].X;
                            Flying[i].Y = flyingPos[Flying[i].Player][Flying[i].Counter.CurrentValue].Y;
                        }
                        else
                        {
                            double totalLength = ApproximateBezierLength(i);
                            double currentDistance = (Flying[i].Counter.CurrentValue / 29.0) * totalLength;
                            double t = GetTForDistance(currentDistance, totalLength, i);

                            if (TJAPlayer3.Skin.Game_Effect_FlyingNotes_IsUsingEasing)
                            {
                                t = EaseOut(t);
                                Flying[i].X = CalculateBezierX(t, i);
                                Flying[i].Y = CalculateBezierY(t, i);
                            }
                            else
                            {
                                Flying[i].X = CalculateBezierX(t, i);
                                Flying[i].Y = CalculateBezierY(t, i);
                            }
                        }                      

                        // Fireworksの描画
                        for (int j = Flying[i].LastPointIndexPassed + 1; j < Flying[i].FireWorksPoints.Count; j++)
                        {
                            if (Flying[i].X >= Flying[i].FireWorksPoints[j].X && !Flying[i].IsRoll)
                            {
                                if (Flying[i].Lane == 3 || Flying[i].Lane == 4)
                                {
                                    TJAPlayer3.stage演奏ドラム画面.FireWorks.Start(Flying[i].Lane, Flying[i].Player, Flying[i].FireWorksPoints[j].X, Flying[i].FireWorksPoints[j].Y);
                                }
                                Flying[i].LastPointIndexPassed = j;
                            }
                        }
                    }
                }

                foreach (var flyingNote in sortedFlying)
                {
                    // sortedFlyingの各要素を描画
                    NotesManager.DisplayNote(flyingNote.Player, (int)flyingNote.X, (int)flyingNote.Y, flyingNote.Lane);
                }
            }
            return base.Draw();
        }

        /// <summary>
        /// ベジエ軌道上の等間隔になる任意のポイントを取得する関数
        /// </summary>
        /// <param name="i">Flyingのインデックス</param>
        /// <param name="count">取得したい数に両端分の2を足した数</param>
        /// <returns></returns>
        private List<Vector2> CalculateBezierPoints(int i, int count)
        {
            List<Vector2> points = new List<Vector2>();
            double totalLength = ApproximateBezierLength(i);
            double segmentLength = totalLength / (count - 1);

            for (int j = 0; j < count; j++)
            {
                double currentDistance = j * segmentLength;
                double t = GetTForDistance(currentDistance, totalLength, i);
                points.Add(CalculateBezier(t, i));
            }

            // 最初と最後のポイントを除く
            points.RemoveAt(0);
            points.RemoveAt(points.Count - 1);

            return points;
        }




        #region [ private ]
        //-----------------

        [StructLayout(LayoutKind.Sequential)]
        private struct Status
        {
            public int Lane;
            public int Player;
            public bool IsUsing;
            public CCounter Counter;
            public double X;
            public double Y;
            public int Height;
            public int Width;
            public double IncreaseX;
            public double IncreaseY;
            public bool IsRoll;
            public int StartPointX;
            public int StartPointY;
            public double Theta;
            public List<Vector2> FireWorksPoints; //　FireWorksの描画されるポイントのリスト
            public int LastPointIndexPassed;  // 最後に通過したポイント
        }

        private Status[] Flying = new Status[128];

        public readonly int[] StartPointX = new int[2];

        //-----------------
        #endregion
    }
}