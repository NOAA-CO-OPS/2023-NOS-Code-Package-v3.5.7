  T  �   k820309    w          19.1        �\�b                                                                                                          
       ice_mechred.f90 ICE_MECHRED                                                     
                @       �                                  
                                                           
                                                           
                                                           
                        �                                  
                @       �                                  
                                                           
       ISTEP1 DYN_DT          @       �                             	     
       WORKA                                                        
    #MESSAGEEQ 
   #GROUPEQ    #DATATYPEEQ    #OPEQ    #WINEQ    #REQUESTEQ    #INFOEQ    #ERRHANDLEREQ    #FILEEQ    #COMMEQ                                                           
    #MESSAGENEQ    #GROUPNEQ    #DATATYPENEQ    #OPNEQ    #WINNEQ    #REQUESTNEQ    #INFONEQ    #ERRHANDLERNEQ    #FILENEQ    #COMMNEQ                                                                                                           
                @                                                    
                &                   &                                                                                        !     KIND                                              "                                                                                                      #                                                                                                     $     
                
                       �?        0.25                                            %     
                
                       �?        0.5                                            &     
                
                 ͯ� ��#@        9.80616                                            '     
                
                      �@        1026.0                                            (     
                
                      ��@        917.0                                            )     
                
                 333333�?        0.15                                            *     
                
                       �?        1.0                                            +     
                
                       9@        25.0                                            ,     
                
                        @        2.0                                            -     
                
                       4@        20.0                                             .                                                                                                     /     
                
                                 0.0                                          0                                                      1                                                      2                                                      3                                                      4                                                      5                       @    �                           6                   
      p           & p         p            p                                                                      7                                                      5         @                               8                   
                &                   &                                                    @                               9                   
                &                   &                   &                                                                                       :     
                
                 :�0�yE>        1.0E-8                                            ;                                                       <                     @                               =                   
                &                   &                                                    @`                              >                   
                &                   &                   &                                                                                       ?     
                   
                  UUUUUU�?                                                 @                   
                &                   &                                                                                    A                   
                &                   &                                                                                       B                                                                                                     C                                                      4                                             D                                       P               80#         @                                  E                   #IMT_LOCAL 0   #NSUM F   #XIN G   #XOUT H             
                                 F                    
                                 G                    
        p        5 r 1   p        5 r 0   p          5 r 0     5 r 1     5 O p            5 r 0     5 r 1     5 O p                                                                   H                    
       p        5 r 0   p          5 r 0     5 r 1       5 r 0     5 r 1                              @`                              I                   
                &                   &                   &                                                    @                               J                   
                &                   &                   &                                                    @                               K                   
                &                   &                   &                                                                                       L     
                
                      �t@        330.0                                           M                         p          p            p                          #         @                                  N                   #JMT_LOCAL 1   #IMT_LOCAL 0   #X1 O   #X2 P   #MAX_ERR Q   #FIELDID R            
                                 O                    
      p        5 r 0   p          5 r 0     5 r 1       5 r 0     5 r 1                              
                                 P                    
      p        5 r 0   p          5 r 0     5 r 1       5 r 0     5 r 1                               
                                 Q     
                
                                 R     P                                                                  S     
                   
                      �bA        %         @                                
                           #LHS T   #RHS V             
                                  T                   #MPI_MESSAGE U             
                                  V                   #MPI_MESSAGE U   %         @                                                           #LHS W   #RHS Y             
                                  W                   #MPI_GROUP X             
                                  Y                   #MPI_GROUP X   %         @                                                           #LHS Z   #RHS \             
                                  Z                   #MPI_DATATYPE [             
                                  \                   #MPI_DATATYPE [   %         @                                                           #LHS ]   #RHS _             
                                  ]                   #MPI_OP ^             
                                  _                   #MPI_OP ^   %         @                                                           #LHS `   #RHS b             
                                  `                   #MPI_WIN a             
                                  b                   #MPI_WIN a   %         @                                                           #LHS c   #RHS e             
                                  c                   #MPI_REQUEST d             
                                  e                   #MPI_REQUEST d   %         @                                                           #LHS f   #RHS h             
                                  f                   #MPI_INFO g             
                                  h                   #MPI_INFO g   %         @                                                           #LHS i   #RHS k             
                                  i                   #MPI_ERRHANDLER j             
                                  k                   #MPI_ERRHANDLER j   %         @                                                           #LHS l   #RHS n             
                                  l                   #MPI_FILE m             
                                  n                   #MPI_FILE m   %         @                                                           #LHS o   #RHS q             
                                  o                   #MPI_COMM p             
                                  q                   #MPI_COMM p   %         @                                                           #LHS r   #RHS s             
                                  r                   #MPI_MESSAGE U             
                                  s                   #MPI_MESSAGE U   %         @                                                           #LHS t   #RHS u             
                                  t                   #MPI_GROUP X             
                                  u                   #MPI_GROUP X   %         @                                                           #LHS v   #RHS w             
                                  v                   #MPI_DATATYPE [             
                                  w                   #MPI_DATATYPE [   %         @                                                           #LHS x   #RHS y             
                                  x                   #MPI_OP ^             
                                  y                   #MPI_OP ^   %         @                                                           #LHS z   #RHS {             
                                  z                   #MPI_WIN a             
                                  {                   #MPI_WIN a   %         @                                                           #LHS |   #RHS }             
                                  |                   #MPI_REQUEST d             
                                  }                   #MPI_REQUEST d   %         @                                                           #LHS ~   #RHS              
                                  ~                   #MPI_INFO g             
                                                     #MPI_INFO g   %         @                                                           #LHS �   #RHS �             
                                  �                   #MPI_ERRHANDLER j             
                                  �                   #MPI_ERRHANDLER j   %         @                                                           #LHS �   #RHS �             
                                  �                   #MPI_FILE m             
                                  �                   #MPI_FILE m   %         @                                                           #LHS �   #RHS �             
                                  �                   #MPI_COMM p             
                                  �                   #MPI_COMM p                                             �                                                       �                                                       �                                                        �     
                
                       1@        17.                                            �     
                  
                       �?        0.25                                            �     
                   
                  B���}@                                                    �     
                  
                       �?        0.5                                            �     
                  
                 333333�?        0.15                                            �     
                
                 �������?        0.05                                            �     
                  
                       �?        1.0                                            �     
                  
                       9@        25.0                                            �     
                  
                        @        2.0                                            �     
                
                     ��A        2.75E5                                            �     
                  
                       4@        20.0         @                               �                   
                &                   &                                                    @                               �                   
                &                   &                                                    @                               �                   
                &                   &                                                    @                               �                   
                &                   &                                                    @                               �                   
                &                   &                                                    @                               �                   
                &                   &                                                    @                               �                   
                &                   &                   &                                                    @                               �                   
                &                   &                   &                                                    @                               �                   
                &                   &                   &                                                    @                               �                   
                &                   &                   &                                                    @                               �                   
                &                   &                   &                                                                                       �                                          ��������        #         @                                   �                     #         @                                   �                   #RIDGE_ICE%JHI �   #RIDGE_ICE%JLO �   #RIDGE_ICE%IHI �   #RIDGE_ICE%ILO �   #RIDGE_ICE%JMT_LOCAL �   #RIDGE_ICE%IMT_LOCAL �   #DELTA �   #DIVU �                                                                                                                                                                                                      �                                                      �                                                      �                                                      �                                                      �                                                      �                     
                                 �                    
      p        5 r �   p          5 r �     5 r �       5 r �     5 r �                              
                                 �                    
      p        5 r �   p          5 r �     5 r �       5 r �     5 r �                     #         @                                  �                     #         @                                  �                     #         @                                  �                    #OPNING �   #CLOSING_GROSS �   #MSNOW_MLT �   #ESNOW_MLT �            
      �                           �                    
      5 r 4     5 r 3   5 r 2   p        5 r 2     & 5 r 2   5 r 3     & 5 r 4   5 r 5         5 r 3   5 r 2   p            5 r 5   5 r 4   p                                   
      �                           �                    
      5 r 4     5 r 3   5 r 2   p        5 r 2     & 5 r 2   5 r 3     & 5 r 4   5 r 5         5 r 3   5 r 2   p            5 r 5   5 r 4   p                                   
D     �                           �                    
       5 r 4     5 r 3   5 r 2   p        5 r 2     & 5 r 2   5 r 3     & 5 r 4   5 r 5         5 r 3   5 r 2   p            5 r 5   5 r 4   p                                   
D     �                           �                    
       5 r 4     5 r 3   5 r 2   p        5 r 2     & 5 r 2   5 r 3     & 5 r 4   5 r 5         5 r 3   5 r 2   p            5 r 5   5 r 4   p                          #         @                                   �                    #KSTRNGTH �             
                                 �                            @                           p     '                    #MPI_VAL �                �                               �                                    @                           m     '                    #MPI_VAL �                �                               �                                    @                           j     '                    #MPI_VAL �                �                               �                                    @                           g     '                    #MPI_VAL �                �                               �                                    @                           d     '                    #MPI_VAL �                �                               �                                    @                           a     '                    #MPI_VAL �                �                               �                                    @                           ^     '                    #MPI_VAL �                �                               �                                    @                           [     '                    #MPI_VAL �                �                               �                                    @                           X     '                    #MPI_VAL �                �                               �                                    @                           U     '                    #MPI_VAL �                �                               �                      �   $      fn#fn    �   @   J   ICE_MODEL_SIZE      @   J   ICE_CONSTANTS    D  @   J   ICE_STATE    �  @   J   ICE_ITD    �  @   J   ICE_GRID      @   J   ICE_FILEUNITS    D  @   j   ICE_DOMAIN    �  N   J  ICE_CALENDAR    �  F   J  ICE_WORK #     �      i@+MPI_CONSTANTS #   �  �      i@+MPI_CONSTANTS $   �  @       ISTEP1+ICE_CALENDAR $   �  @       DYN_DT+ICE_CALENDAR    .  �       WORKA+ICE_WORK #   �  =       KIND+ICE_KINDS_MOD '     p       INT_KIND+ICE_KINDS_MOD '     p       DBL_KIND+ICE_KINDS_MOD "   �  t       P25+ICE_CONSTANTS !   c  s       P5+ICE_CONSTANTS %   �  w       GRAVIT+ICE_CONSTANTS #   M  v       RHOW+ICE_CONSTANTS #   �  u       RHOI+ICE_CONSTANTS "   8	  t       P15+ICE_CONSTANTS "   �	  s       C1I+ICE_CONSTANTS "   
  t       C25+ICE_CONSTANTS "   �
  s       C2I+ICE_CONSTANTS "     t       C20+ICE_CONSTANTS '   z  p       LOG_KIND+ICE_KINDS_MOD "   �  s       C0I+ICE_CONSTANTS %   ]  @       IMT_LOCAL+ICE_DOMAIN %   �  @       JMT_LOCAL+ICE_DOMAIN    �  @       ILO+ICE_DOMAIN      @       IHI+ICE_DOMAIN    ]  @       JLO+ICE_DOMAIN    �  @       JHI+ICE_DOMAIN     �  �       HIN_MAX+ICE_ITD $   �  q       NCAT+ICE_MODEL_SIZE     �  �       AICE0+ICE_STATE     �  �       AICEN+ICE_STATE #   R  v       PUNY+ICE_CONSTANTS $   �  @       NU_DIAG+CONTROL=IPT #     @       MY_TASK+ICE_DOMAIN #   H  �       STRENGTH+ICE_STATE     �  �       VICEN+ICE_STATE #   �  p       P333+ICE_CONSTANTS      �       VICE+ICE_STATE    �  �       AICE+ICE_STATE &   `  p       NTILAY+ICE_MODEL_SIZE %   �  q       NILYR+ICE_MODEL_SIZE '   A  r       CHAR_LEN+ICE_KINDS_MOD #   �  t       COLUMN_SUM+ICE_ITD (   '  @   a   COLUMN_SUM%NSUM+ICE_ITD '   g  $  a   COLUMN_SUM%XIN+ICE_ITD (   �  �   a   COLUMN_SUM%XOUT+ICE_ITD     _  �       EICEN+ICE_STATE       �       VSNON+ICE_STATE     �  �       ESNON+ICE_STATE #   �  u       RHOS+ICE_CONSTANTS      �       ILYR1+ICE_ITD 2   �  �       COLUMN_CONSERVATION_CHECK+ICE_ITD 5   ,  �   a   COLUMN_CONSERVATION_CHECK%X1+ICE_ITD 5      �   a   COLUMN_CONSERVATION_CHECK%X2+ICE_ITD :   �  @   a   COLUMN_CONSERVATION_CHECK%MAX_ERR+ICE_ITD :     P   a   COLUMN_CONSERVATION_CHECK%FIELDID+ICE_ITD %   d  p       LFRESH+ICE_CONSTANTS (   �  b       MESSAGEEQ+MPI_CONSTANTS ,   6  Y   a   MESSAGEEQ%LHS+MPI_CONSTANTS ,   �  Y   a   MESSAGEEQ%RHS+MPI_CONSTANTS &   �  b       GROUPEQ+MPI_CONSTANTS *   J   W   a   GROUPEQ%LHS+MPI_CONSTANTS *   �   W   a   GROUPEQ%RHS+MPI_CONSTANTS )   �   b       DATATYPEEQ+MPI_CONSTANTS -   Z!  Z   a   DATATYPEEQ%LHS+MPI_CONSTANTS -   �!  Z   a   DATATYPEEQ%RHS+MPI_CONSTANTS #   "  b       OPEQ+MPI_CONSTANTS '   p"  T   a   OPEQ%LHS+MPI_CONSTANTS '   �"  T   a   OPEQ%RHS+MPI_CONSTANTS $   #  b       WINEQ+MPI_CONSTANTS (   z#  U   a   WINEQ%LHS+MPI_CONSTANTS (   �#  U   a   WINEQ%RHS+MPI_CONSTANTS (   $$  b       REQUESTEQ+MPI_CONSTANTS ,   �$  Y   a   REQUESTEQ%LHS+MPI_CONSTANTS ,   �$  Y   a   REQUESTEQ%RHS+MPI_CONSTANTS %   8%  b       INFOEQ+MPI_CONSTANTS )   �%  V   a   INFOEQ%LHS+MPI_CONSTANTS )   �%  V   a   INFOEQ%RHS+MPI_CONSTANTS +   F&  b       ERRHANDLEREQ+MPI_CONSTANTS /   �&  \   a   ERRHANDLEREQ%LHS+MPI_CONSTANTS /   '  \   a   ERRHANDLEREQ%RHS+MPI_CONSTANTS %   `'  b       FILEEQ+MPI_CONSTANTS )   �'  V   a   FILEEQ%LHS+MPI_CONSTANTS )   (  V   a   FILEEQ%RHS+MPI_CONSTANTS %   n(  b       COMMEQ+MPI_CONSTANTS )   �(  V   a   COMMEQ%LHS+MPI_CONSTANTS )   &)  V   a   COMMEQ%RHS+MPI_CONSTANTS )   |)  b       MESSAGENEQ+MPI_CONSTANTS -   �)  Y   a   MESSAGENEQ%LHS+MPI_CONSTANTS -   7*  Y   a   MESSAGENEQ%RHS+MPI_CONSTANTS '   �*  b       GROUPNEQ+MPI_CONSTANTS +   �*  W   a   GROUPNEQ%LHS+MPI_CONSTANTS +   I+  W   a   GROUPNEQ%RHS+MPI_CONSTANTS *   �+  b       DATATYPENEQ+MPI_CONSTANTS .   ,  Z   a   DATATYPENEQ%LHS+MPI_CONSTANTS .   \,  Z   a   DATATYPENEQ%RHS+MPI_CONSTANTS $   �,  b       OPNEQ+MPI_CONSTANTS (   -  T   a   OPNEQ%LHS+MPI_CONSTANTS (   l-  T   a   OPNEQ%RHS+MPI_CONSTANTS %   �-  b       WINNEQ+MPI_CONSTANTS )   ".  U   a   WINNEQ%LHS+MPI_CONSTANTS )   w.  U   a   WINNEQ%RHS+MPI_CONSTANTS )   �.  b       REQUESTNEQ+MPI_CONSTANTS -   ./  Y   a   REQUESTNEQ%LHS+MPI_CONSTANTS -   �/  Y   a   REQUESTNEQ%RHS+MPI_CONSTANTS &   �/  b       INFONEQ+MPI_CONSTANTS *   B0  V   a   INFONEQ%LHS+MPI_CONSTANTS *   �0  V   a   INFONEQ%RHS+MPI_CONSTANTS ,   �0  b       ERRHANDLERNEQ+MPI_CONSTANTS 0   P1  \   a   ERRHANDLERNEQ%LHS+MPI_CONSTANTS 0   �1  \   a   ERRHANDLERNEQ%RHS+MPI_CONSTANTS &   2  b       FILENEQ+MPI_CONSTANTS *   j2  V   a   FILENEQ%LHS+MPI_CONSTANTS *   �2  V   a   FILENEQ%RHS+MPI_CONSTANTS &   3  b       COMMNEQ+MPI_CONSTANTS *   x3  V   a   COMMNEQ%LHS+MPI_CONSTANTS *   �3  V   a   COMMNEQ%RHS+MPI_CONSTANTS    $4  @       KSTRENGTH    d4  @       KRDG_PARTIC    �4  @       KRDG_REDIST    �4  s       CF    W5  t       CS    �5  p       CP    ;6  s       FSNOWRDG    �6  t       GSTAR    "7  t       ASTAR    �7  s       MAXRAFT    	8  t       HSTAR    }8  s       MU_RDG    �8  v       PSTAR    f9  t       CSTAR    �9  �       DARDG1DT    ~:  �       DARDG2DT    ";  �       DVIRDGDT    �;  �       OPENING    j<  �       ASUM    =  �       AKSUM    �=  �       APARTIC    n>  �       HRMIN    *?  �       HRMAX    �?  �       HREXP    �@  �       KRDG %   ^A  p       L_CONSERVATION_CHECK    �A  H       INIT_MECHRED    B  t      RIDGE_ICE )   �C  @     RIDGE_ICE%JHI+ICE_DOMAIN )   �C  @     RIDGE_ICE%JLO+ICE_DOMAIN )   
D  @     RIDGE_ICE%IHI+ICE_DOMAIN )   JD  @     RIDGE_ICE%ILO+ICE_DOMAIN /   �D  @     RIDGE_ICE%JMT_LOCAL+ICE_DOMAIN /   �D  @     RIDGE_ICE%IMT_LOCAL+ICE_DOMAIN     
E  �   a   RIDGE_ICE%DELTA    �E  �   a   RIDGE_ICE%DIVU    �F  H       RIDGE_PREP    �F  H       ASUM_RIDGING    BG  �       RIDGE_SHIFT #   �G  T  a   RIDGE_SHIFT%OPNING *   I  T  a   RIDGE_SHIFT%CLOSING_GROSS &   oJ  T  a   RIDGE_SHIFT%MSNOW_MLT &   �K  T  a   RIDGE_SHIFT%ESNOW_MLT    M  V       ICE_STRENGTH &   mM  @   a   ICE_STRENGTH%KSTRNGTH '   �M  ]       MPI_COMM+MPI_CONSTANTS /   
N  H   a   MPI_COMM%MPI_VAL+MPI_CONSTANTS '   RN  ]       MPI_FILE+MPI_CONSTANTS /   �N  H   a   MPI_FILE%MPI_VAL+MPI_CONSTANTS -   �N  ]       MPI_ERRHANDLER+MPI_CONSTANTS 5   TO  H   a   MPI_ERRHANDLER%MPI_VAL+MPI_CONSTANTS '   �O  ]       MPI_INFO+MPI_CONSTANTS /   �O  H   a   MPI_INFO%MPI_VAL+MPI_CONSTANTS *   AP  ]       MPI_REQUEST+MPI_CONSTANTS 2   �P  H   a   MPI_REQUEST%MPI_VAL+MPI_CONSTANTS &   �P  ]       MPI_WIN+MPI_CONSTANTS .   CQ  H   a   MPI_WIN%MPI_VAL+MPI_CONSTANTS %   �Q  ]       MPI_OP+MPI_CONSTANTS -   �Q  H   a   MPI_OP%MPI_VAL+MPI_CONSTANTS +   0R  ]       MPI_DATATYPE+MPI_CONSTANTS 3   �R  H   a   MPI_DATATYPE%MPI_VAL+MPI_CONSTANTS (   �R  ]       MPI_GROUP+MPI_CONSTANTS 0   2S  H   a   MPI_GROUP%MPI_VAL+MPI_CONSTANTS *   zS  ]       MPI_MESSAGE+MPI_CONSTANTS 2   �S  H   a   MPI_MESSAGE%MPI_VAL+MPI_CONSTANTS 