  �,  r   k820309    w          19.1        �\�b                                                                                                          
       ice_init.f90 ICE_INIT                                                     
                                                                                           P               80                                                  KIND                                                                                                                                                                                           �               128                                                                                                      #         @                                                      #IUNIT    #INSTR 	   #IOPT 
             
                                                                                      	                     1           
                                 
                           #         @                                                      #ER1    #ER2    #ER3    #ER4                                                                  1                                                               1                                                               1                                                               1                                                                                                   5                                                                                                                                                                                                       4%         @                                                           #LHS    #RHS              
                                                     #MPI_MESSAGE              
                                                     #MPI_MESSAGE    %         @                                                           #LHS    #RHS              
                                                     #MPI_GROUP              
                                                     #MPI_GROUP    %         @                                                           #LHS    #RHS              
                                                     #MPI_DATATYPE              
                                                     #MPI_DATATYPE    %         @                                                           #LHS     #RHS "             
                                                      #MPI_OP !             
                                  "                   #MPI_OP !   %         @                                #                           #LHS $   #RHS &             
                                  $                   #MPI_WIN %             
                                  &                   #MPI_WIN %   %         @                                '                           #LHS (   #RHS *             
                                  (                   #MPI_REQUEST )             
                                  *                   #MPI_REQUEST )   %         @                                +                           #LHS ,   #RHS .             
                                  ,                   #MPI_INFO -             
                                  .                   #MPI_INFO -   %         @                                /                           #LHS 0   #RHS 2             
                                  0                   #MPI_ERRHANDLER 1             
                                  2                   #MPI_ERRHANDLER 1   %         @                                3                           #LHS 4   #RHS 6             
                                  4                   #MPI_FILE 5             
                                  6                   #MPI_FILE 5   %         @                                7                           #LHS 8   #RHS :             
                                  8                   #MPI_COMM 9             
                                  :                   #MPI_COMM 9   %         @                                ;                           #LHS <   #RHS =             
                                  <                   #MPI_MESSAGE              
                                  =                   #MPI_MESSAGE    %         @                                >                           #LHS ?   #RHS @             
                                  ?                   #MPI_GROUP              
                                  @                   #MPI_GROUP    %         @                                A                           #LHS B   #RHS C             
                                  B                   #MPI_DATATYPE              
                                  C                   #MPI_DATATYPE    %         @                                D                           #LHS E   #RHS F             
                                  E                   #MPI_OP !             
                                  F                   #MPI_OP !   %         @                                G                           #LHS H   #RHS I             
                                  H                   #MPI_WIN %             
                                  I                   #MPI_WIN %   %         @                                J                           #LHS K   #RHS L             
                                  K                   #MPI_REQUEST )             
                                  L                   #MPI_REQUEST )   %         @                                M                           #LHS N   #RHS O             
                                  N                   #MPI_INFO -             
                                  O                   #MPI_INFO -   %         @                                P                           #LHS Q   #RHS R             
                                  Q                   #MPI_ERRHANDLER 1             
                                  R                   #MPI_ERRHANDLER 1   %         @                                S                           #LHS T   #RHS U             
                                  T                   #MPI_FILE 5             
                                  U                   #MPI_FILE 5   %         @                                V                           #LHS W   #RHS X             
                                  W                   #MPI_COMM 9             
                                  X                   #MPI_COMM 9                                             Y     P                   @                              Z     P       #         @                                   [                    #INPUT_DATA%NT \   #INPUT_DATA%KB ]   #INPUT_DATA%MT ^                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           \                                                     ]                                                     ^            #         @                                   _                    #INIT_STATE%NT `   #INIT_STATE%KB a   #INIT_STATE%MT b   #INIT_STATE%JLO c   #INIT_STATE%JHI d   #INIT_STATE%ILO e   #INIT_STATE%IHI f                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                `                                                     a                                                     b                                                      c                                                      d                                                      e                                                      f            #         @                                   g                                                                                                                                                                                                                                                                                                                                                                                                                             @                           9     '                    #MPI_VAL h                �                               h                                    @                           5     '                    #MPI_VAL i                �                               i                                    @                           1     '                    #MPI_VAL j                �                               j                                    @                           -     '                    #MPI_VAL k                �                               k                                    @                           )     '                    #MPI_VAL l                �                               l                                    @                           %     '                    #MPI_VAL m                �                               m                                    @                           !     '                    #MPI_VAL n                �                               n                                    @                                '                    #MPI_VAL o                �                               o                                    @                                '                    #MPI_VAL p                �                               p                                    @                                '                    #MPI_VAL q                �                               q                      �         fn#fn    �   @   J   ICE_DOMAIN '   �   r       CHAR_LEN+ICE_KINDS_MOD #   p  =       KIND+ICE_KINDS_MOD '   �  p       INT_KIND+ICE_KINDS_MOD ,     s       CHAR_LEN_LONG+ICE_KINDS_MOD '   �  p       DBL_KIND+ICE_KINDS_MOD        h       FOPEN+MOD_UTILS &   h  @   a   FOPEN%IUNIT+MOD_UTILS &   �  L   a   FOPEN%INSTR+MOD_UTILS %   �  P   a   FOPEN%IOPT+MOD_UTILS &   D  l       FATAL_ERROR+MOD_UTILS *   �  L   a   FATAL_ERROR%ER1+MOD_UTILS *   �  L   a   FATAL_ERROR%ER2+MOD_UTILS *   H  L   a   FATAL_ERROR%ER3+MOD_UTILS *   �  L   a   FATAL_ERROR%ER4+MOD_UTILS $   �  q       NCAT+ICE_MODEL_SIZE &   Q  p       NTILAY+ICE_MODEL_SIZE %   �  q       NILYR+ICE_MODEL_SIZE (   2  b       MESSAGEEQ+MPI_CONSTANTS ,   �  Y   a   MESSAGEEQ%LHS+MPI_CONSTANTS ,   �  Y   a   MESSAGEEQ%RHS+MPI_CONSTANTS &   F  b       GROUPEQ+MPI_CONSTANTS *   �  W   a   GROUPEQ%LHS+MPI_CONSTANTS *   �  W   a   GROUPEQ%RHS+MPI_CONSTANTS )   V	  b       DATATYPEEQ+MPI_CONSTANTS -   �	  Z   a   DATATYPEEQ%LHS+MPI_CONSTANTS -   
  Z   a   DATATYPEEQ%RHS+MPI_CONSTANTS #   l
  b       OPEQ+MPI_CONSTANTS '   �
  T   a   OPEQ%LHS+MPI_CONSTANTS '   "  T   a   OPEQ%RHS+MPI_CONSTANTS $   v  b       WINEQ+MPI_CONSTANTS (   �  U   a   WINEQ%LHS+MPI_CONSTANTS (   -  U   a   WINEQ%RHS+MPI_CONSTANTS (   �  b       REQUESTEQ+MPI_CONSTANTS ,   �  Y   a   REQUESTEQ%LHS+MPI_CONSTANTS ,   =  Y   a   REQUESTEQ%RHS+MPI_CONSTANTS %   �  b       INFOEQ+MPI_CONSTANTS )   �  V   a   INFOEQ%LHS+MPI_CONSTANTS )   N  V   a   INFOEQ%RHS+MPI_CONSTANTS +   �  b       ERRHANDLEREQ+MPI_CONSTANTS /     \   a   ERRHANDLEREQ%LHS+MPI_CONSTANTS /   b  \   a   ERRHANDLEREQ%RHS+MPI_CONSTANTS %   �  b       FILEEQ+MPI_CONSTANTS )      V   a   FILEEQ%LHS+MPI_CONSTANTS )   v  V   a   FILEEQ%RHS+MPI_CONSTANTS %   �  b       COMMEQ+MPI_CONSTANTS )   .  V   a   COMMEQ%LHS+MPI_CONSTANTS )   �  V   a   COMMEQ%RHS+MPI_CONSTANTS )   �  b       MESSAGENEQ+MPI_CONSTANTS -   <  Y   a   MESSAGENEQ%LHS+MPI_CONSTANTS -   �  Y   a   MESSAGENEQ%RHS+MPI_CONSTANTS '   �  b       GROUPNEQ+MPI_CONSTANTS +   P  W   a   GROUPNEQ%LHS+MPI_CONSTANTS +   �  W   a   GROUPNEQ%RHS+MPI_CONSTANTS *   �  b       DATATYPENEQ+MPI_CONSTANTS .   `  Z   a   DATATYPENEQ%LHS+MPI_CONSTANTS .   �  Z   a   DATATYPENEQ%RHS+MPI_CONSTANTS $     b       OPNEQ+MPI_CONSTANTS (   v  T   a   OPNEQ%LHS+MPI_CONSTANTS (   �  T   a   OPNEQ%RHS+MPI_CONSTANTS %     b       WINNEQ+MPI_CONSTANTS )   �  U   a   WINNEQ%LHS+MPI_CONSTANTS )   �  U   a   WINNEQ%RHS+MPI_CONSTANTS )   *  b       REQUESTNEQ+MPI_CONSTANTS -   �  Y   a   REQUESTNEQ%LHS+MPI_CONSTANTS -   �  Y   a   REQUESTNEQ%RHS+MPI_CONSTANTS &   >  b       INFONEQ+MPI_CONSTANTS *   �  V   a   INFONEQ%LHS+MPI_CONSTANTS *   �  V   a   INFONEQ%RHS+MPI_CONSTANTS ,   L  b       ERRHANDLERNEQ+MPI_CONSTANTS 0   �  \   a   ERRHANDLERNEQ%LHS+MPI_CONSTANTS 0   
  \   a   ERRHANDLERNEQ%RHS+MPI_CONSTANTS &   f  b       FILENEQ+MPI_CONSTANTS *   �  V   a   FILENEQ%LHS+MPI_CONSTANTS *     V   a   FILENEQ%RHS+MPI_CONSTANTS &   t  b       COMMNEQ+MPI_CONSTANTS *   �  V   a   COMMNEQ%LHS+MPI_CONSTANTS *   ,  V   a   COMMNEQ%RHS+MPI_CONSTANTS    �  @       ADVECTION    �  @       ICE_IC      P      INPUT_DATA &   R  @     INPUT_DATA%NT+LIMS=NT &   �  @     INPUT_DATA%KB+LIMS=KB &   �  @     INPUT_DATA%MT+LIMS=MT       �      INIT_STATE &   �"  @     INIT_STATE%NT+LIMS=NT &   #  @     INIT_STATE%KB+LIMS=KB &   G#  @     INIT_STATE%MT+LIMS=MT *   �#  @     INIT_STATE%JLO+ICE_DOMAIN *   �#  @     INIT_STATE%JHI+ICE_DOMAIN *   $  @     INIT_STATE%ILO+ICE_DOMAIN *   G$  @     INIT_STATE%IHI+ICE_DOMAIN    �$  �      INIT_FLUX '   F&  ]       MPI_COMM+MPI_CONSTANTS /   �&  H   a   MPI_COMM%MPI_VAL+MPI_CONSTANTS '   �&  ]       MPI_FILE+MPI_CONSTANTS /   H'  H   a   MPI_FILE%MPI_VAL+MPI_CONSTANTS -   �'  ]       MPI_ERRHANDLER+MPI_CONSTANTS 5   �'  H   a   MPI_ERRHANDLER%MPI_VAL+MPI_CONSTANTS '   5(  ]       MPI_INFO+MPI_CONSTANTS /   �(  H   a   MPI_INFO%MPI_VAL+MPI_CONSTANTS *   �(  ]       MPI_REQUEST+MPI_CONSTANTS 2   7)  H   a   MPI_REQUEST%MPI_VAL+MPI_CONSTANTS &   )  ]       MPI_WIN+MPI_CONSTANTS .   �)  H   a   MPI_WIN%MPI_VAL+MPI_CONSTANTS %   $*  ]       MPI_OP+MPI_CONSTANTS -   �*  H   a   MPI_OP%MPI_VAL+MPI_CONSTANTS +   �*  ]       MPI_DATATYPE+MPI_CONSTANTS 3   &+  H   a   MPI_DATATYPE%MPI_VAL+MPI_CONSTANTS (   n+  ]       MPI_GROUP+MPI_CONSTANTS 0   �+  H   a   MPI_GROUP%MPI_VAL+MPI_CONSTANTS *   ,  ]       MPI_MESSAGE+MPI_CONSTANTS 2   p,  H   a   MPI_MESSAGE%MPI_VAL+MPI_CONSTANTS 