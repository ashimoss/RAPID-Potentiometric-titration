MODULE MainModule
    CONST robtarget PointHomeR:=[[321.0674,-205.7252,235.3691],[0.09988241,-0.7731192,0.6258925,0.02385204],[0,-1,-1,4],[116.1942,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    PERS bool Point_1;
    PERS bool Point_2;
    PERS bool Point_3;
    PERS bool Point_4;
    PERS bool Point_5;
    VAR speeddata rotation :=[5,10,5000,1000];
    VAR speeddata fast :=[50,500,5000,1000];

    PROC Main ()
 
        InitializeCSR;
        Point_1:= FALSE;
        Point_2:= FALSE;
        Point_3:= FALSE;
        Point_4:= FALSE;
        Point_5:= FALSE;
        g_init \maxSpd:=25, \holdForce:=20, \Calibrate, \Grip;
        Waituntil(Point_2);
        
        MoveHomeR;
        
        TakeDispenser;
        TakeTipCounter 1, 1;
        
        Waituntil(Point_3);
        
        DispBottle 30;
        DispTubeCounter 1,1;
        
        ReturnDispenser;
        
        Point_4:=TRUE;

        DropTip;
        
        MoveHomeR;

    ENDPROC
    
    
    PROC MoveHomeR ()
        MoveJ PointHomeR, v30, z5, GripperRight2; 
        WaitRob \ZeroSpeed;               
    ENDPROC
    
    ENDMODULE