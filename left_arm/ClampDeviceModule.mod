MODULE ClampDeviceModule
    CONST robtarget PointTubeComLeft:=[[113.1472,-164.7927,240.6162],[0.005792527,0.7035929,-0.7105345,-0.008012357],[2,0,-1,4],[-101.6142,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointTubeLeftUP:=[[62.90928,-215.6302,161.6664],[0.005795362,0.7036059,-0.7105216,-0.008007989],[2,0,-1,4],[-101.6235,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointTubeLeftSIDE:=[[103.1861,-38.45941,276.7884],[0.03514654,-0.02173035,-0.7135586,0.6993759],[1,-1,1,4],[-103.8488,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    CONST robtarget PointBottleComLeft:=[[112.8987,-164.7895,340.384],[0.006015798,0.7035171,-0.7106044,-0.008299164],[1,0,-1,4],[-101.6164,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointBottleLeftUP:=[[66.7057,-204.1741,160.7108],[0.006457157,0.7054185,-0.7086906,-0.01003718],[2,0,-2,4],[-101.4453,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointBottleLeftSIDE:=[[104.9539,-39.24519,342.7919],[0.7094248,0.7045958,-0.01592373,-0.002761656],[1,-1,-1,4],[-94.80123,9E+09,9E+09,9E+09,9E+09,9E+09]];
       
    CONST robtarget PointPourOutVertical:=[[131.0751,38.47046,164.4961],[0.4594626,-0.4518714,0.5536708,-0.5274041],[-2,-2,1,4],[-125.7971,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointPourOutHorizontal:=[[131.0803,38.4698,164.4939],[0.6427394,0.04687864,0.7616427,0.06774208],[-2,-2,2,4],[-125.7965,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PointClampDevice:=[[103.3884,1.564379,336.6129],[0.005721035,0.70359,-0.7105381,-0.00799472],[1,0,-1,4],[-103.8481,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    CONST robtarget PointTubeTrash:=[[156.5809,-14.02407,298.7911],[0.4594292,-0.4518614,0.5536986,-0.5274125],[0,-1,1,4],[-125.7968,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    VAR robtarget temp12;
    VAR robtarget temp13;
    VAR robtarget temp14;
    VAR robtarget temp15;
    
    
    
    PROC TubeTakeCounter (num CellNX, num CellNY)
        
        !MoveJ PointPourOutVertical,v30,z5,GripperLeft, \WObj:= TitrationLeftCellCS; !for rewriting points
        
        MoveL PointTubeComLeft, v30, z5, GripperLeft2,\WObj:=TubeLeftCS;
        
        temp12:= PointTubeLeftUP;
        temp12.trans.x:=temp12.trans.x + 50*(CellNX-1);
        temp12.trans.y:=temp12.trans.y + 50*(CellNY-1);
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
        
        g_moveto(12);
        waittime 1;
                
        temp12:= PointTubeLeftUP;
        temp12.trans.x:=temp12.trans.x + 50*(CellNX-1);
        temp12.trans.y:=temp12.trans.y + 50*(CellNY-1);
        temp12.trans.z := temp12.trans.z - 55;
        MoveL temp12,v30,z0,GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
          
        g_gripin;
        waittime 1;
               
        temp12:= PointTubeLeftUP;
        temp12.trans.x:=temp12.trans.x + 50*(CellNX-1);
        temp12.trans.y:=temp12.trans.y + 50*(CellNY-1);
        temp12.trans.z := temp12.trans.z + 100;
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
        
        temp12:= PointTubeComLeft;
        temp12.trans.z := temp12.trans.z + 100;
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
        
        temp12:= PointClampDevice;
        temp12.trans.z := temp12.trans.z + 100;
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
         
        temp12:= PointClampDevice;
        temp12.trans.z := temp12.trans.z - 32;
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
           
        ClampDeviceMoveTo 10;
        Waittime 5;
                                                           
    ENDPROC
    
    PROC TubePutCounter (num CellNX, num CellNY)      
        
        ClampDeviceMoveTo 15;
        Waittime 5;
        
        temp13:= PointClampDevice;
        temp13.trans.z := temp13.trans.z + 50;
        MoveL temp13, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        g_moveto(12);
        waittime 1;
        
        temp13:= PointClampDevice;
        temp13.trans.z := temp13.trans.z - 32;
        MoveL temp13, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
         
        g_gripin;
        waittime 1;
        
        temp13:= PointClampDevice;
        temp13.trans.z := temp13.trans.z + 100;
        MoveL temp13, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        temp13:= PointTubeComLeft;
        temp13.trans.z := temp13.trans.z + 100;
        MoveL temp13, v30, z5, GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
               
        temp13:= PointTubeLeftUP;
        temp13.trans.x:=temp13.trans.x + 50*(CellNX-1);
        temp13.trans.y:=temp13.trans.y + 50*(CellNY-1);
        temp13.trans.z := temp13.trans.z + 100;
        MoveL temp13, v30, z5, GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
        
        temp13:= PointTubeLeftUP;
        temp13.trans.x:=temp13.trans.x + 50*(CellNX-1);
        temp13.trans.y:=temp13.trans.y + 50*(CellNY-1);
        temp13.trans.z := temp13.trans.z - 50;
        MoveL temp13,v30,z0,GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
                 
        g_moveto(12);
        waittime 1;
        
        temp13:= PointTubeLeftUP;
        temp13.trans.x:=temp13.trans.x + 50*(CellNX-1);
        temp13.trans.y:=temp13.trans.y + 50*(CellNY-1);
        temp13.trans.z := temp13.trans.z + 100;
        MoveL temp13,v30,z0,GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
        
        g_gripin;
        waittime 1;
        
        MoveL PointTubeComLeft,v30,z0,GripperLeft2,\WObj:=TubeLeftCS;
    
    ENDPROC
    
    PROC TubeToTrash ()
        
        MoveL PointTubeTrash,v30,z0,GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
        
        g_GripOut;
        waittime 1;
        
    ENDPROC
    
    PROC BottleTakeCounter (num CellNX, num CellNY)
               
        MoveL PointBottleComLeft, v30, z5, GripperLeft2,\WObj:=BottleLeftCS;
        WaitRob \ZeroSpeed;
        
        temp14:= PointBottleComLeft;
        temp14.trans.z:=temp14.trans.z - 140;
        MoveL temp14, v30, z5, GripperLeft2,\WObj:=BottleLeftCS;
        WaitRob \ZeroSpeed;
        
        temp14:= PointBottleLeftUP;
        temp14.trans.x:=temp14.trans.x + 80*(CellNX-1);
        temp14.trans.y:=temp14.trans.y + 80*(CellNY-1);
        MoveL temp14, v30, z5, GripperLeft2,\WObj:=BottleLeftCS;
        WaitRob \ZeroSpeed;
        
        g_moveto(22);
        waittime 1;
                
        temp14:= PointBottleLeftUP;
        temp14.trans.x:=temp14.trans.x + 80*(CellNX-1);
        temp14.trans.y:=temp14.trans.y + 80*(CellNY-1);
        temp14.trans.z := temp14.trans.z - 63;
        MoveL temp14,v30,z0,BottleL,\WObj:=BottleLeftCS;
        WaitRob \ZeroSpeed;
          
        g_gripin;
        waittime 1;
               
        temp14:= PointBottleLeftUP;
        temp14.trans.x:=temp14.trans.x + 80*(CellNX-1);
        temp14.trans.y:=temp14.trans.y + 80*(CellNY-1);
        temp14.trans.z := temp14.trans.z + 65;
        MoveL temp14, v30, z5, BottleL,\WObj:=BottleLeftCS;
        WaitRob \ZeroSpeed;
        
        ClampDeviceMoveTo 150;
        Waittime 5;
        
        MoveL PointBottleComLeft, v30, z5, BottleL,\WObj:=BottleLeftCS;
        WaitRob \ZeroSpeed;
        
        MoveL PointClampDevice, v30, z5, BottleL,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        temp14:= PointClampDevice;
        temp14.trans.z := temp14.trans.z - 50;
        MoveL temp14, v30, z5, BottleL,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        ClampDeviceMoveTo 90;
        Waittime 5;
        
        g_gripout;
        waittime 1;
        
        temp14:= PointClampDevice;
        temp14.trans.z := temp14.trans.z + 90; 
        MoveL temp14, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        temp14:= PointBottleLeftSIDE;
        temp14.trans.z := temp14.trans.z + 200;
        MoveJ temp14, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
                                                   
    ENDPROC
    
    PROC BottlePutCounter (num CellNX, num CellNY)
        
        ClampDeviceMoveTo 100;
        Waittime 5;
        
        temp15:= PointClampDevice;
        temp15.trans.z := temp15.trans.z + 100;
        MoveL temp15, v30, z5, BottleL,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        temp15:= PointClampDevice;
        temp15.trans.z := temp15.trans.z - 53;
        MoveL temp15, v30, z5, BottleL,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        g_GripIn;
        waittime 1;
        
        temp15:= PointClampDevice;
        temp15.trans.z := temp15.trans.z + 100;
        MoveL temp15, v30, z5, BottleL,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        temp15:= PointBottleComLeft;
        temp15.trans.z := temp15.trans.z + 100;
        MoveL temp15, v30, z5, BottleL,\WObj:=BottleLeftCS;
        WaitRob \ZeroSpeed;
        
        temp15:= PointBottleLeftUP;
        temp15.trans.x:=temp15.trans.x + 80*(CellNX-1);
        temp15.trans.y:=temp15.trans.y + 80*(CellNY-1);
        temp15.trans.z := temp15.trans.z + 100;
        MoveL temp15, v30, z5, BottleL,\WObj:=BottleLeftCS;
        WaitRob \ZeroSpeed;
        
        temp15:= PointBottleLeftUP;
        temp15.trans.x:=temp15.trans.x + 80*(CellNX-1);
        temp15.trans.y:=temp15.trans.y + 80*(CellNY-1);
        temp15.trans.z := temp15.trans.z - 60;
        MoveL temp15,v30,z0,BottleL,\WObj:=BottleLeftCS;
        WaitRob \ZeroSpeed;
                 
        g_gripout;
        waittime 1;
        
        temp15:= PointBottleLeftUP;
        temp15.trans.x:=temp15.trans.x + 80*(CellNX-1);
        temp15.trans.y:=temp15.trans.y + 80*(CellNY-1);
        temp15.trans.z := temp15.trans.z + 100;
        MoveL temp15,v30,z0,BottleL,\WObj:=BottleLeftCS;
        WaitRob \ZeroSpeed;
        
        g_gripin;
        waittime 1;
        
    ENDPROC
    
    PROC PourOut (num CellNX, num CellNY)
        
        MoveL PointTubeComLeft, v30, z5, GripperLeft2,\WObj:=TubeLeftCS;
        
        temp12:= PointTubeLeftUP;
        temp12.trans.x:=temp12.trans.x + 50*(CellNX-1);
        temp12.trans.y:=temp12.trans.y + 50*(CellNY-1);
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
        
        g_moveto(12);
        waittime 1;
                
        temp12:= PointTubeLeftUP;
        temp12.trans.x:=temp12.trans.x + 50*(CellNX-1);
        temp12.trans.y:=temp12.trans.y + 50*(CellNY-1);
        temp12.trans.z := temp12.trans.z - 55;
        MoveL temp12,v30,z0,GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
          
        g_gripin;
        waittime 1;
               
        temp12:= PointTubeLeftUP;
        temp12.trans.x:=temp12.trans.x + 50*(CellNX-1);
        temp12.trans.y:=temp12.trans.y + 50*(CellNY-1);
        temp12.trans.z := temp12.trans.z + 120;
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
        
        temp12:= PointTubeComLeft;
        temp12.trans.z := temp12.trans.z + 120;
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=TubeLeftCS;
        WaitRob \ZeroSpeed;
        
        temp12:= PointClampDevice;
        temp12.trans.z := temp12.trans.z + 120;
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        ClampDeviceMoveTo 20;
        Waittime 5;
         
        temp12:= PointClampDevice;
        temp12.trans.z := temp12.trans.z - 32;
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
           
        ClampDeviceMoveTo 10;
        Waittime 5;
        
        g_moveto(15);
        
        temp12:= PointClampDevice;
        temp12.trans.z := temp12.trans.z + 120;
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
            
        temp12:= PointTubeLeftSIDE;
        temp12.trans.z := temp12.trans.z + 120;
        MoveJ temp12, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        MoveL PointTubeLeftSIDE, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        g_gripin;
        
        ClampDeviceMoveTo 20;
        Waittime 5;
        
        temp12:= PointTubeLeftSIDE;
        temp12.trans.z := temp12.trans.z + 70;
        MoveL temp12, v30, z5, GripperLeft2,\WObj:=ClampDeviceLeftCS;
        WaitRob \ZeroSpeed;
        
        temp12:= PointPourOutVertical;
        temp12.trans.z := temp12.trans.z + 100;
        temp12.trans.y := temp12.trans.y + 40;
        temp12.trans.x := temp12.trans.x - 50;
        MoveL temp12, v30, z5, GripperLeft,\WObj:=TitrationLeftCellCS;
        WaitRob \ZeroSpeed;
                 
        temp12:= PointPourOutVertical;
        temp12.trans.y := temp12.trans.y + 40;
        MoveL temp12, v30, z5, GripperLeft,\WObj:=TitrationLeftCellCS;
        WaitRob \ZeroSpeed;
        
        MoveL PointPourOutVertical, v30, z5, GripperLeft,\WObj:=TitrationLeftCellCS;
        WaitRob \ZeroSpeed;
        
        MoveJ PointPourOutHorizontal, slow2, z5, GripperLeft,\WObj:=TitrationLeftCellCS;
        WaitRob \ZeroSpeed;
        waittime 5;
        
        temp12:= PointPourOutHorizontal;
        temp12.trans.y := temp12.trans.y + 20;
        MoveL temp12, v30, z5, GripperLeft,\WObj:=TitrationLeftCellCS;
        WaitRob \ZeroSpeed;
        
        temp12:= PointPourOutVertical;
        temp12.trans.y := temp12.trans.y + 20;
        MoveJ temp12, slow2, z5, GripperLeft,\WObj:=TitrationLeftCellCS;
        WaitRob \ZeroSpeed;
        
        
        temp12:= PointPourOutVertical;
        temp12.trans.x := temp12.trans.x - 100;
        temp12.trans.z := temp12.trans.z + 150;
        MoveL temp12, v30, z5, GripperLeft,\WObj:=TitrationLeftCellCS;
        WaitRob \ZeroSpeed;
    ENDPROC
    
ENDMODULE