MODULE BottleCapStationModule
    CONST robtarget PointCapBottleCOM:=[[-70.60777,-107.93503,535.0192],[0.5116363,0.5106342,0.48114,0.495969],[0,-2,-1,4],[-94.8062,9E+09,9E+09,9E+09,9E+09,9E+09]];    
    CONST robtarget PointCapBottleNORTH:=[[-23.60777,-107.93503,540.0192],[0.5116363,0.5106342,0.48114,0.495969],[0,-2,-1,4],[-94.8062,9E+09,9E+09,9E+09,9E+09,9E+09]];              
    CONST robtarget PointCapBottleSOUTH:=[[135.5844,-6.417501,554.0014],[0.5126028,0.4886561,-0.503866,0.4945428],[0,-1,-1,4],[133.5769,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointCapBottleWEST:=[[94.45049,-113.1488,462.9842],[0.03722523,0.02299382,0.6985279,0.7142439],[2,1,0,4],[-91.81349,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointCapBottleEAST:=[[135.5844,-6.417501,554.0014],[0.5126028,0.4886561,-0.503866,0.4945428],[0,-1,-1,4],[133.5769,9E+09,9E+09,9E+09,9E+09,9E+09]];

    VAR robtarget temp16;
    VAR robtarget temp17;
    VAR robtarget temp18;
    VAR robtarget temp19;
    VAR robtarget temp20;
    VAR robtarget temp21;
    VAR robtarget temp22;
    VAR robtarget temp23;
    
    PROC BottleCapPutCounterNORTH (num CellNX, num CellNY, num CapNY, num CapNZ) ! num CapNX
        
        temp14:= PointBottleLeftSIDE;
        temp14.trans.z := temp14.trans.z - 45;
        MoveL temp14, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        g_GripIn;
        waittime 1;
        
        ClampDeviceOpen;
        Waittime 4;
        
        temp16:= PointBottleLeftSIDE;
        temp16.trans.z := temp16.trans.z - 25;
        MoveL temp16, slow, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;

        temp16:= PointBottleLeftSIDE;
        temp16.trans.z := temp16.trans.z + 100;
        MoveL temp16, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;

        MoveL PointCapBottleCOM, v30, z5, GripperLeft2,\WObj:=BottleCapStationCS; 
        
        Point_1:=TRUE;
        
        IF (CellNX = 1 AND (CellNY = 1 OR CellNY = 5)) 
        OR (CellNX = 3 AND CellNY = 1)
        OR (CellNX = 5 AND (CellNY = 1 OR CellNY = 3 OR CellNY = 5))

        THEN
        ErrWrite "CELL_ERROR", "Cell does not exist " + NumToStr(CellNX,0) + "," + NumToStr(CellNY,0);
        Stop;
        ENDIF
        
        temp16 := PointCapBottleNORTH;
        temp16.trans.z := temp16.trans.z + 85*(CapNZ-1);
        MoveL temp16, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp16 := PointCapBottleNORTH;
        temp16.trans.x := temp16.trans.x + 30*(CellNX-1);
        temp16.trans.y := temp16.trans.y + 30*(CellNY-1);
        temp16.trans.x := temp16.trans.x + 62; 
        temp16.trans.y := temp16.trans.y + 80*(CapNY-1);
        temp16.trans.z := temp16.trans.z + 85*(CapNZ-1);
        MoveL temp16, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp16 := PointCapBottleNORTH;
        temp16.trans.x := temp16.trans.x + 30*(CellNX-1);
        temp16.trans.y := temp16.trans.y + 30*(CellNY-1);
        temp16.trans.x := temp16.trans.x + 62;
        temp16.trans.z := temp16.trans.z - 10; 
        temp16.trans.y := temp16.trans.y + 80*(CapNY-1);
        temp16.trans.z := temp16.trans.z + 85*(CapNZ-1);
        MoveL temp16, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        g_gripout;
        waittime 1;
        
        temp16 := PointCapBottleNORTH;
        temp16.trans.x := temp16.trans.x + 30*(CellNX-1);
        temp16.trans.y := temp16.trans.y + 30*(CellNY-1);
        temp16.trans.x := temp16.trans.x + 62;
        temp16.trans.z := temp16.trans.z + 10;
        temp16.trans.y := temp16.trans.y + 80*(CapNY-1);
        temp16.trans.z := temp16.trans.z + 85*(CapNZ-1);
        MoveL temp16, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp16 := PointCapBottleNORTH;
        temp16.trans.x := temp16.trans.x + 30*(CellNX-1);
        temp16.trans.y := temp16.trans.y + 30*(CellNY-1);
        temp16.trans.z := temp16.trans.z + 10;
        temp16.trans.x := temp16.trans.x - 62; 
        temp16.trans.y := temp16.trans.y + 80*(CapNY-1);
        temp16.trans.z := temp16.trans.z + 85*(CapNZ-1);
        MoveL temp16, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp16 := PointCapBottleNORTH;
        temp16.trans.z := temp16.trans.z + 85*(CapNZ-1);
        MoveL temp16, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        MoveL PointCapBottleCOM, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
                                               
    ENDPROC
    
    PROC BottleCapTakeCounterNORTH (num CellNX, num CellNY, num CapNY, num CapNZ) ! num CapNX
        
        MoveL PointCapBottleCOM, v30, z5, GripperLeft2,\WObj:=BottleCapStationCS; 
        
       IF (CellNX = 1 AND (CellNY = 1 OR CellNY = 5)) 
        OR (CellNX = 3 AND CellNY = 1)
        OR (CellNX = 5 AND (CellNY = 1 OR CellNY = 3 OR CellNY = 5))

        THEN
        ErrWrite "CELL_ERROR", "Cell does not exist " + NumToStr(CellNX,0) + "," + NumToStr(CellNY,0);
        Stop;
        ENDIF
        
        temp17 := PointCapBottleNORTH;
        temp17.trans.z := temp17.trans.z + 85*(CapNZ-1);
        MoveL temp17, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        g_gripout;
        
        temp17 := PointCapBottleNORTH;
        temp17.trans.x := temp17.trans.x + 30*(CellNX-1);
        temp17.trans.y := temp17.trans.y + 30*(CellNY-1);
        temp17.trans.x := temp17.trans.x + 64; 
        temp17.trans.y := temp17.trans.y + 80*(CapNY-1);
        temp17.trans.z := temp17.trans.z + 85*(CapNZ-1);
        MoveL temp17, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp17 := PointCapBottleNORTH;
        temp17.trans.x := temp17.trans.x + 30*(CellNX-1);
        temp17.trans.y := temp17.trans.y + 30*(CellNY-1);
        temp17.trans.x := temp17.trans.x + 64;
        temp17.trans.z := temp17.trans.z - 19; 
        temp17.trans.y := temp17.trans.y + 80*(CapNY-1);
        temp17.trans.z := temp17.trans.z + 85*(CapNZ-1);
        MoveL temp17, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        g_gripin;
        waittime 1;
        
        temp17 := PointCapBottleNORTH;
        temp17.trans.x := temp17.trans.x + 30*(CellNX-1);
        temp17.trans.y := temp17.trans.y + 30*(CellNY-1);
        temp17.trans.x := temp17.trans.x + 64;
        temp17.trans.z := temp17.trans.z + 19;
        temp17.trans.y := temp17.trans.y + 80*(CapNY-1);
        temp17.trans.z := temp17.trans.z + 85*(CapNZ-1);
        MoveL temp17, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp17 := PointCapBottleNORTH;
        temp17.trans.x := temp17.trans.x + 30*(CellNX-1);
        temp17.trans.y := temp17.trans.y + 30*(CellNY-1);
        temp17.trans.z := temp17.trans.z + 19;
        temp17.trans.x := temp17.trans.x - 64; 
        temp17.trans.y := temp17.trans.y + 80*(CapNY-1);
        temp17.trans.z := temp17.trans.z + 85*(CapNZ-1);
        MoveL temp17, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp17 := PointCapBottleNORTH;
        temp17.trans.z := temp17.trans.z + 85*(CapNZ-1);
        MoveL temp17, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        MoveL PointCapBottleCOM, v30, z5, GripperLeft2, \WObj:=BottleCapStationCS;
        WaitRob \ZeroSpeed;
        
        temp17:= PointBottleLeftSIDE;
        temp17.trans.z := temp17.trans.z + 10;
        MoveL temp17, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        temp17 := PointBottleLeftSIDE;
        temp17.trans.z := temp17.trans.z - 29.4;
        MoveL temp17, v30, z5, GripperLeft2, \WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        ClampDeviceClose;
        Waittime 4;
        
        temp17:= PointBottleLeftSIDE;
        temp17.trans.z := temp17.trans.z - 30;
        MoveL temp17, slow, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        
    ENDPROC
    
    PROC BottleCapPutCounterSOUTH (num CellNX, num CellNY, num CapNY, num CapNZ) ! num CapNX
                                 
    ENDPROC
    
    PROC BottleCapPutCounterWEST (num CellNX, num CellNY, num CapNX, num CapNZ) ! num CapNY
                                            
    ENDPROC
    
    PROC BottleCapPutCounterEAST (num CellNX, num CellNY, num CapNX, num CapNZ) ! num CapNY
                                
    ENDPROC
ENDMODULE