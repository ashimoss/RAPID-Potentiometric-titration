MODULE TubeDispStation
    CONST robtarget PointTubeCom:=[[132.1141,44.64455,640],[0.6871822,-0.2212414,0.656271,0.2194111],[-1,0,0,5],[126.4615,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointDispTube:=[[74.04166,-1.217723,436.1878],[0.6871758,-0.2212417,0.6562778,0.2194105],[-1,0,0,5],[126.4676,9E+09,9E+09,9E+09,9E+09,9E+09]]; 

    VAR robtarget temp6;
    
    PROC DispTubeCounter (num CellNX, num CellNY)
        
        !MoveJ PointDispTube,v100,z5,GripperRight2, \WObj:= TubeDispStationCS; ! for rewriting points
        
        MoveL PointTubeCom, v30, z5, DispenserR,\WObj:=TubeDispStationCS;
        
        temp6:= PointTubeCom;
        temp6.trans.z := temp6.trans.z - 150;    
        MoveL temp6,v30,z0,DispenserR,\WObj:=TubeDispStationCS;
        WaitRob \ZeroSpeed;
        
        temp6:= PointDispTube;
        temp6.trans.x:=temp6.trans.x + 50*(CellNX-1);
        temp6.trans.y:=temp6.trans.y + 50*(CellNY-1);
        temp6.trans.z:=temp6.trans.z + 30;
        MoveL temp6, v30, z5, DispenserR,\WObj:=TubeDispStationCS;
        WaitRob \ZeroSpeed;
                
        temp6:= PointDispTube;
        temp6.trans.x:=temp6.trans.x + 50*(CellNX-1);
        temp6.trans.y:=temp6.trans.y + 50*(CellNY-1);
        temp6.trans.z := temp6.trans.z - 5;    
        MoveL temp6,v30,z0,DispenserR,\WObj:=TubeDispStationCS;
        WaitRob \ZeroSpeed;
          
        g_gripin;
        waittime 6;
              
        g_gripout;
         
        g_gripin;
                     
        g_gripout;
        
        temp6:= PointDispTube;
        temp6.trans.x:=temp6.trans.x + 50*(CellNX-1);
        temp6.trans.y:=temp6.trans.y + 50*(CellNY-1);
        temp6.trans.z:=temp6.trans.z + 50;
        MoveL temp6, v30, z5, DispenserR,\WObj:=TubeDispStationCS;
                
        MoveL PointTubeCom, v30, z5, DispenserR,\WObj:=TubeDispStationCS;
        WaitRob \ZeroSpeed;      
                                                   
    ENDPROC
    
ENDMODULE