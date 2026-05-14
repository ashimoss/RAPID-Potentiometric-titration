MODULE TubeCapStationModule
    CONST robtarget PointTubeCapCom:=[[114.3698,0.4436207,161.8278],[0.01105453,0.03197136,0.9993731,0.01044515],[1,1,0,4],[-102.8203,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointCapTube:=[[64.75009,-49.47195,89.08527],[0.01100892,0.03214158,0.9993662,0.0106242],[1,2,-1,4],[-102.8447,9E+09,9E+09,9E+09,9E+09,9E+09]]; 

    VAR robtarget temp10;
    VAR robtarget temp11;
                   
    PROC TubeCapPutCounter (num CellNX, num CellNY)
        !MoveJ PointTubeCapCom,v100,z5,GripperLeft2, \WObj:= TubeCapStationCS; !for rewriting points
        
        ClampDeviceOpen;
        Waittime 4;
        
        temp10:= PointClampDevice;
        temp10.trans.z := temp10.trans.z -20;
        MoveL temp10, slow, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        temp10:= PointTubeCapCom;
        temp10.trans.z := temp10.trans.z + 180;
        MoveL temp10, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
        
        MoveL PointTubeCapCom, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp10:= PointCapTube;
        temp10.trans.x:=temp10.trans.x + 50*(CellNX-1);
        temp10.trans.y:=temp10.trans.y + 50*(CellNY-1);
        MoveL temp10, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp10:= PointCapTube;
        temp10.trans.x:=temp10.trans.x + 50*(CellNX-1);
        temp10.trans.y:=temp10.trans.y + 50*(CellNY-1);
        temp10.trans.z := temp10.trans.z - 30;
        MoveL temp10, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
                
        g_moveto(12);
        waittime 1;
                      
        temp10:= PointCapTube;
        temp10.trans.x:=temp10.trans.x + 50*(CellNX-1);
        temp10.trans.y:=temp10.trans.y + 50*(CellNY-1);
        temp10.trans.z := temp10.trans.z + 40;
        MoveL temp10, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
        
        g_gripin;
        waittime 1;
                
        MoveL PointTubeCapCom, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
                                                   
    ENDPROC
    
    PROC TubeCapTakeCounter (num CellNX, num CellNY)
            
        !MoveJ PointTubeCapCom,v100,z5,GripperLeft2, \WObj:= TubeCapStationCS; !for rewriting points
        
        temp11:= PointTubeCapCom;
        temp11.trans.z := temp11.trans.z + 50;
        MoveL temp11, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
        
        MoveL PointTubeCapCom, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp11:= PointCapTube;
        temp11.trans.x:=temp11.trans.x + 50*(CellNX-1);
        temp11.trans.y:=temp11.trans.y + 50*(CellNY-1);
        MoveL temp11, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
        
        g_moveto(12);
        waittime 1;
        
        temp11:= PointCapTube;
        temp11.trans.x:=temp11.trans.x + 50*(CellNX-1);
        temp11.trans.y:=temp11.trans.y + 50*(CellNY-1);
        temp11.trans.z := temp11.trans.z -30;
        MoveL temp11, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
        
        g_gripin;
        waittime 1;
        
        temp11:= PointCapTube;
        temp11.trans.x:=temp11.trans.x + 50*(CellNX-1);
        temp11.trans.y:=temp11.trans.y + 50*(CellNY-1);
        temp11.trans.z := temp11.trans.z + 30;
        MoveL temp11, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
        
        MoveL PointTubeCapCom, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp11:= PointTubeCapCom;
        temp11.trans.z := temp11.trans.z + 100;
        MoveL temp11, v30, z5, GripperLeft2,\WObj:=TubeCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp11:= PointClampDevice;
        temp11.trans.z := temp11.trans.z + 100;
        MoveL temp11, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        MoveL PointClampDevice, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
      
    ENDPROC

ENDMODULE