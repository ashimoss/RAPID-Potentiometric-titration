MODULE TipsModule
    CONST robtarget PointTipsCom:=[[150.3196,25.27685,550],[0.7173931,0.0177405,0.6962239,-0.0174582],[0,0,-1,5],[156.5915,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointTakeTip:=[[72.9647,-43.24173,190],[0.7158326,0.01837192,0.6978387,-0.01634751],[1,0,-1,5],[164.4139,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointTakeTipRotation:=[[74.00876,-43.72223,190],[0.583367,-0.4152101,0.5678231,0.4060301],[1,-2,1,5],[168.8617,9E+09,9E+09,9E+09,9E+09,9E+09]];

    VAR robtarget temp4;
       
    PROC TakeTipCounter (num CellNX, num CellNY) 
        !MoveL PointTakeTip, v30, z5, DispenserTip, \WObj:=TipsCS; ! for rewriting points
        
        MoveL PointTipsCom, v30, z5, DispenserR,\WObj:=TipsCS;     
        
        temp4 := PointTakeTip;
        temp4.trans.x:=temp4.trans.x + 30*(CellNX-1);
        temp4.trans.y:=temp4.trans.y + 30*(CellNY-1);
        temp4.trans.z := temp4.trans.z + 120;
        MoveL temp4, v30, z5, DispenserTip,\WObj:=TipsCS;
        
        MoveL PointTakeTip, v30, z5, DispenserTip,\WObj:=TipsCS;
        
        temp4 := PointTakeTip;
        temp4.trans.x:=temp4.trans.x + 30*(CellNX-1);
        temp4.trans.y:=temp4.trans.y + 30*(CellNY-1);
        temp4.trans.z := temp4.trans.z - 28;
        MoveL temp4, v30, z0, DispenserTip,\WObj:=TipsCS;
        WaitRob \ZeroSpeed;  
        
        temp4:= PointTakeTip;
        temp4.trans.x:=temp4.trans.x + 30*(CellNX-1);
        temp4.trans.y:=temp4.trans.y + 30*(CellNY-1);
        temp4.trans.z := temp4.trans.z + 160;
        MoveL temp4,v30,z0,DispenserTip,\WObj:=TipsCS;
        WaitRob \ZeroSpeed;  
        
        MoveL PointTipsCom, v30, z5, DispenserR,\WObj:=TipsCS;
        
        g_GripIn;
        
        Waituntil(Point_1);
        
    ENDPROC
    
ENDMODULE