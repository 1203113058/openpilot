#!/usr/bin/env python3
import time
import cereal.messaging as messaging

def main():
    sm = messaging.SubMaster(['modelV2', 'liveParameters', 'liveTracks'])

    print("等待模型数据...")
    while True:
        sm.update()

        if sm.updated['modelV2']:
            model = sm['modelV2']
            print("\n--- 模型数据 ---")
            print(f"姿态: {model.position}")
            print(f"速度: {model.velocity}")
            print(f"加速度: {model.acceleration}")
            print(f"方向: {model.orientation}")
            print(f"车道线数量: {len(model.laneLines)}")
            print(f"道路边缘数量: {len(model.roadEdges)}")
            print(f"车辆数量: {len(model.leads)}")

        if sm.updated['liveParameters']:
            params = sm['liveParameters']
            print("\n--- 车辆参数 ---")
            print(f"刚度: {params.stiffnessFactor}")
            print(f"转向比: {params.steerRatio}")

        if sm.updated['liveTracks']:
            tracks = sm['liveTracks']
            print("\n--- 检测到的物体 ---")
            print(f"物体数量: {len(tracks)}")
            for i, track in enumerate(tracks[:3]):  # 只显示前3个
                print(f"物体 {i}: 距离={track.dRel:.1f}m, 相对速度={track.vRel:.1f}m/s")

        time.sleep(0.1)

if __name__ == "__main__":
    main()