MODULE MainModule
    CONST robtarget PointHomeL:=[[384.8238,281.168,286.3342],[0.018304,-0.6940756,-0.7195289,0.01422159],[0,1,1,4],[-121.7637,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS bool Point_1;
    PERS bool Point_2;
    PERS bool Point_3;
    PERS bool Point_4;
    PERS bool Point_5;
    
    VAR speeddata slow :=[0.8,500,5000,1000];
    VAR speeddata slow2 :=[30,25,5000,1000];
    
    PROC Main()
        
        InitializeCSL;
        Point_1:= FALSE;
        Point_2:= FALSE;
        Point_3:= FALSE;
        Point_4:= FALSE; 
        Point_5:= FALSE;
        g_init \maxSpd:=25, \holdForce:=20, \Calibrate, \Grip;
        soc_connect;
        Reset custom_DO_3;
        Point_2:=TRUE;
        
        MoveHomeL;
        
        TubeTakeCounter 1,1;
        TubeCapPutCounter 1,1;
        TubePutCounter 1,1;

        BottleTakeCounter 2,1;
        BottleCapPutCounterNORTH 5,4,1,1;
        MoveHomeL;
        
        Point_3:=TRUE;
        
        Waituntil(Point_4);
        
        BottlePutCounter 2,1;
        
        PourOut 1,1;
        SetDO custom_DO_3, 1;
        TubeToTrash;
        MoveHomeL;
!        BottleTakeCounter 2,1;
        BottleCapTakeCounterNORTH 5,4,1,1;
        BottlePutCounter 2,1;
        
        MoveHomeL;
        soc_disconnect; 
         
        ERROR
            TPWrite "ERR: " + ValToStr(ERRNO);
            soc_disconnect; 
    ENDPROC
    
    PROC MoveHomeL ()
        MoveJ PointHomeL, v30, z5, GripperLeft2; 
        WaitRob \ZeroSpeed;      
    ENDPROC
    
ENDMODULE