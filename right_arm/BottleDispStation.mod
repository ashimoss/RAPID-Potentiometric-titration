MODULE BottleDispStation
    CONST robtarget PointDispClampDevice:=[[150.1137,33.59359,600],[0.7173724,0.01777372,0.6962425,-0.01753004],[0,1,0,5],[126.5209,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    VAR robtarget temp5;
              
    PROC DispBottle (num DispOffset)
        
        !MoveJ PointDispClampDevice, v30, z0, DispenserR,\WObj:=ClampDeviceRightCS; !FOR REWRITING POINTS
        
        temp5:= PointDispClampDevice;
        temp5.trans.z := temp5.trans.z + 40;
        MoveL temp5, v30, z0, DispenserR,\WObj:=ClampDeviceRightCS;
        WaitRob \inpos;
        waittime 1;
        
!        g_gripout;
!        waittime 1;
        
!        g_gripin;
!        waittime 2;
         
        MoveL PointDispClampDevice, v30, z0, DispenserR,\WObj:=ClampDeviceRightCS;
        
        temp5:= PointDispClampDevice;
        temp5.trans.z := temp5.trans.z - 8 - DispOffset;
        MoveL temp5, v30, z0, DispenserR,\WObj:=ClampDeviceRightCS;
        WaitRob \inpos;
        waittime 2;
        
        g_gripout;
        waittime 5;
        
        temp5:= PointDispClampDevice;
        temp5.trans.z := temp5.trans.z + 40;
        MoveL temp5, v30, z0, DispenserR,\WObj:=ClampDeviceRightCS;
        
    ENDPROC
    
ENDMODULE