MODULE DispenserModule
    CONST robtarget PointDispenserTake:=[[144.9765,31.58877,481.5972],[0.7126215,0.003890562,0.7014803,0.008991483],[0,0,-1,5],[167.4256,9E+09,9E+09,9E+09,9E+09,9E+09]];              
    !CONST robtarget PointTipDrop:=[[143.055,3.53327,480.4153],[0.007689275,-0.8842055,0.4670233,-0.003288572],[0,0,-1,4],[127.0825,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointTipDrop:=[[131.1367,42.45391,465.7953],[0.003139413,0.7201962,-0.6937633,-0.0001805255],[0,0,-1,4],[94.88953,9E+09,9E+09,9E+09,9E+09,9E+09]];
!    [0.7017586,-0.003241305,0.7123883,-0.005219019]
    !CONST robtarget test1:=[[152.3787,212.2339,324.75],[0.7008114,-0.1440706,0.6829642,0.1471972],[0,-1,0,5],[129.2332,9E+09,9E+09,9E+09,9E+09,9E+09]];

    VAR robtarget temp1;
    VAR robtarget temp2;
    VAR robtarget temp3;
    
    
    PROC TakeDispenser () 
        !MoveL PointTipDrop, v30, z5, GripperRight2,\WObj:=DispenserCS;  ! for rewriting points
        
        temp1 := PointDispenserTake;
        temp1.trans.y := temp1.trans.y + 80;
        MoveJ temp1, v30, z5, GripperRight2,\WObj:=DispenserCS; 
        WaitRob \ZeroSpeed;
        
        g_GripOut;
        WaitRob \ZeroSpeed;
                   
        MoveL PointDispenserTake, v30, z0, DispenserR,\WObj:=DispenserCS;
        WaitRob \ZeroSpeed;
        waittime 2;
        
        temp1 := PointDispenserTake;
        temp1.trans.z := temp1.trans.z + 19;
        MoveL temp1, v30, z5, DispenserR,\WObj:=DispenserCS;
        WaitRob \ZeroSpeed;
        
        temp1 := PointDispenserTake;
        temp1.trans.x := temp1.trans.x - 100;
        temp1.trans.z := temp1.trans.z + 19;
        MoveL temp1, v30, z5, DispenserR,\WObj:=DispenserCS;
        WaitRob \ZeroSpeed;
        
        
        temp1 := PointDispenserTake;
        temp1.trans.x := temp1.trans.x - 100;
        temp1.trans.y := temp1.trans.y + 60;
        temp1.trans.z := temp1.trans.z + 19;
        MoveL temp1, v30, z5, DispenserR,\WObj:=DispenserCS;
        WaitRob \ZeroSpeed;
                                        
    ENDPROC
    
    PROC ReturnDispenser () 
        
        temp2 := PointDispenserTake;
        temp2.trans.x := temp2.trans.x - 100;
        temp2.trans.z := temp2.trans.z + 19;
        temp2.trans.y := temp2.trans.y + 60;
        MoveL temp2, v30, z5, DispenserR,\WObj:=DispenserCS;
        WaitRob \ZeroSpeed;
        
        temp2 := PointDispenserTake;
        temp2.trans.z := temp2.trans.z + 19;
        temp2.trans.x := temp2.trans.x - 100;
        MoveL temp2, v30, z5, DispenserR,\WObj:=DispenserCS;
        WaitRob \ZeroSpeed;
        
        temp2 := PointDispenserTake;
        temp2.trans.z := temp2.trans.z + 19;
        temp2.trans.x := temp2.trans.x - 1;
        temp2.trans.y := temp2.trans.y + 2;
        MoveL temp2, v30, z0, DispenserR,\WObj:=DispenserCS;
        WaitRob \inpos;
        
        temp2 := PointDispenserTake;
        temp2.trans.z := temp2.trans.z + 1;
        temp2.trans.x := temp2.trans.x - 1;
        temp2.trans.y := temp2.trans.y + 2;
        MoveL temp2, v30, z0, DispenserR,\WObj:=DispenserCS;
        WaitRob \inpos;
        
        Waittime 1;
        
        temp2 := PointDispenserTake;
        temp2.trans.y := temp2.trans.y + 100;
        MoveL temp2, v30, z5, GripperRight2,\WObj:=DispenserCS;
        WaitRob \ZeroSpeed;
                                                       
    ENDPROC
    
    PROC DropTip () 
        temp3 := PointDispenserTake;
        temp3.trans.y := temp3.trans.y + 80;
        MoveJ temp3, v30, z0, GripperRight2,\WObj:=DispenserCS;
        WaitRob \ZeroSpeed;
        
         g_GripIn;
         
        temp3 := PointTipDrop;
        temp3.trans.y := temp3.trans.y + 120;
        MoveJ temp3, v30, z5, GripperRight2,\WObj:=DispenserCS;
        
        g_GripOut;
        waittime 1;
        
        MoveL PointTipDrop, v30, z0, GripperRight2,\WObj:=DispenserCS;
        
        temp3 := PointTipDrop;
        temp3.trans.z := temp3.trans.z - 22;
        MoveL temp3, v30, z0, GripperRight2,\WObj:=DispenserCS;
        WaitRob \inpos;
        Waittime 1;
        
        MoveL PointTipDrop, v30, z0, GripperRight2,\WObj:=DispenserCS;
               
        temp3 := PointTipDrop;
        temp3.trans.y := temp3.trans.y + 100;
        MoveL temp3, v30, z0, GripperRight2,\WObj:=DispenserCS;
        
        temp3 := PointTipDrop;
        temp3.trans.x := temp3.trans.x - 100;
        temp3.trans.y := temp3.trans.y + 100;
        MoveL temp3, v30, z0, GripperRight2,\WObj:=DispenserCS;
                                                       
    ENDPROC

ENDMODULE