MODULE TCPSocketCommunication
    
    PROC soc_connect()
        VAR socketdev server_socket;
        VAR socketdev client_socket;
        VAR string client_ip;
        VAR string receive_string;
        
        SocketCreate server_socket;
        SocketBind server_socket, "192.168.125.1", 5000;
        SocketListen server_socket;    
        
        TPWrite "Waiting for connection...";
        SocketAccept server_socket, client_socket \ClientAddress:=client_ip;
        TPWrite "Client connected: " + ValToStr(client_ip);
        SocketSend client_socket \Str := ValToStr(1);
        TPWrite "Turn ON";
        SocketReceive client_socket \Str := receive_string;
        TPWrite "Received msg: " + receive_string;
        WaitTime 3;
        
        SocketSend client_socket \Str := ValToStr(2);
        TPWrite "Turn OFF";
        SocketReceive client_socket \Str := receive_string;
        TPWrite "Received msg: " + receive_string;
        WaitTime 3;
        
        
!        WaitTime 3;
        
!        SocketSend client_socket \Str := "Hello client with ip-address " + client_ip;
        
        
        
        SocketClose client_socket;

        ERROR
            TPWrite "ERR: " + ValToStr(ERRNO);
            RETRY;
        UNDO
            SocketClose server_socket;
            SocketClose client_socket;
    ENDPROC
    
ENDMODULE