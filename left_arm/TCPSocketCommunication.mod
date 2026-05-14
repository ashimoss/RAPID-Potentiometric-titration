MODULE TCPSocketCommunication
        VAR socketdev server_socket;
        VAR socketdev client_socket;
        VAR string client_ip;
        VAR string receive_string;

    PROC soc_connect()
        SocketCreate server_socket;
        SocketBind server_socket, "192.168.125.1", 5000;
        SocketListen server_socket;    
        TPWrite "Waiting for connection...";
        SocketAccept server_socket, client_socket \ClientAddress:=client_ip;
        TPWrite "Client connected: " + ValToStr(client_ip);
    ENDPROC
    
    
    PROC ClampDeviceOpen ()     
        SocketSend client_socket \Str := ValToStr(1001);

        ERROR
            TPWrite "ERR: " + ValToStr(ERRNO);
            RETRY;
        UNDO
            SocketClose server_socket;
            SocketClose client_socket;
            
    ENDPROC
     
    PROC ClampDeviceClose ()     
        SocketSend client_socket \Str := ValToStr(1002);
!        Waittime 1;
!        SocketReceive client_socket \Str := receive_string;
!        TPWrite "Received msg: " + receive_string;
!        Waittime 2;

        ERROR
            TPWrite "ERR: " + ValToStr(ERRNO);
            RETRY;
        UNDO
            SocketClose server_socket;
            SocketClose client_socket;
            
    ENDPROC

     PROC ClampDeviceMoveTo (num angle)     
        SocketSend client_socket \Str := ValToStr(angle);
!        Waittime 1;
!        SocketReceive client_socket \Str := receive_string;
!        TPWrite "Received msg: " + receive_string;
!        Waittime 2;

        ERROR
            TPWrite "ERR: " + ValToStr(ERRNO);
            RETRY;
        UNDO
            SocketClose server_socket;
            SocketClose client_socket;
            
    ENDPROC
    
    PROC soc_disconnect()
        SocketClose client_socket;   
        SocketClose server_socket;
        TPWrite "Client disconnected: " + ValToStr(client_ip);
        
    ENDPROC
    
ENDMODULE