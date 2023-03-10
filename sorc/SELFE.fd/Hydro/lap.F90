SUBROUTINE DSPTRF( UPLO, N, AP, IPIV, INFO )
CHARACTER UPLO
INTEGER INFO, N
INTEGER IPIV( * )
DOUBLE PRECISION AP( * )
DOUBLE PRECISION ZERO, ONE
PARAMETER ( ZERO = 0.0D+0, ONE = 1.0D+0 )
DOUBLE PRECISION EIGHT, SEVTEN
PARAMETER ( EIGHT = 8.0D+0, SEVTEN = 17.0D+0 )
LOGICAL UPPER
INTEGER I, IMAX, J, JMAX, K, KC, KK, KNC, KP, KPC, &
& KSTEP, KX, NPP
DOUBLE PRECISION ABSAKK, ALPHA, COLMAX, D11, D12, D21, D22, R1, &
& ROWMAX, T, WK, WKM1, WKP1
LOGICAL LSAME
INTEGER IDAMAX
EXTERNAL LSAME, IDAMAX
EXTERNAL DSCAL, DSPR, DSWAP, XERBLA
INTRINSIC ABS, MAX, SQRT
INFO = 0
UPPER = LSAME( UPLO, 'U' )
IF( .NOT.UPPER .AND. .NOT.LSAME( UPLO, 'L' ) ) THEN
INFO = -1
ELSE IF( N.LT.0 ) THEN
INFO = -2
END IF
IF( INFO.NE.0 ) THEN
CALL XERBLA( 'DSPTRF', -INFO )
RETURN
END IF
ALPHA = ( ONE+SQRT( SEVTEN ) ) / EIGHT
IF( UPPER ) THEN
K = N
KC = ( N-1 )*N / 2 + 1
10 CONTINUE
KNC = KC
IF( K.LT.1 ) GO TO 110
KSTEP = 1
ABSAKK = ABS( AP( KC+K-1 ) )
IF( K.GT.1 ) THEN
IMAX = IDAMAX( K-1, AP( KC ), 1 )
COLMAX = ABS( AP( KC+IMAX-1 ) )
ELSE
COLMAX = ZERO
END IF
IF( MAX( ABSAKK, COLMAX ).EQ.ZERO ) THEN
IF( INFO.EQ.0 ) INFO = K
KP = K
ELSE
IF( ABSAKK.GE.ALPHA*COLMAX ) THEN
KP = K
ELSE
ROWMAX = ZERO
JMAX = IMAX
KX = IMAX*( IMAX+1 ) / 2 + IMAX
DO 20 J = IMAX + 1, K
IF( ABS( AP( KX ) ).GT.ROWMAX ) THEN
ROWMAX = ABS( AP( KX ) )
JMAX = J
END IF
KX = KX + J
20 CONTINUE
KPC = ( IMAX-1 )*IMAX / 2 + 1
IF( IMAX.GT.1 ) THEN
JMAX = IDAMAX( IMAX-1, AP( KPC ), 1 )
ROWMAX = MAX( ROWMAX, ABS( AP( KPC+JMAX-1 ) ) )
END IF
IF( ABSAKK.GE.ALPHA*COLMAX*( COLMAX / ROWMAX ) ) THEN
KP = K
ELSE IF( ABS( AP( KPC+IMAX-1 ) ).GE.ALPHA*ROWMAX ) THEN
KP = IMAX
ELSE
KP = IMAX
KSTEP = 2
END IF
END IF
KK = K - KSTEP + 1
IF( KSTEP.EQ.2 ) KNC = KNC - K + 1
IF( KP.NE.KK ) THEN
CALL DSWAP( KP-1, AP( KNC ), 1, AP( KPC ), 1 )
KX = KPC + KP - 1
DO 30 J = KP + 1, KK - 1
KX = KX + J - 1
T = AP( KNC+J-1 )
AP( KNC+J-1 ) = AP( KX )
AP( KX ) = T
30 CONTINUE
T = AP( KNC+KK-1 )
AP( KNC+KK-1 ) = AP( KPC+KP-1 )
AP( KPC+KP-1 ) = T
IF( KSTEP.EQ.2 ) THEN
T = AP( KC+K-2 )
AP( KC+K-2 ) = AP( KC+KP-1 )
AP( KC+KP-1 ) = T
END IF
END IF
IF( KSTEP.EQ.1 ) THEN
R1 = ONE / AP( KC+K-1 )
CALL DSPR( UPLO, K-1, -R1, AP( KC ), 1, AP )
CALL DSCAL( K-1, R1, AP( KC ), 1 )
ELSE
IF( K.GT.2 ) THEN
D12 = AP( K-1+( K-1 )*K / 2 )
D22 = AP( K-1+( K-2 )*( K-1 ) / 2 ) / D12
D11 = AP( K+( K-1 )*K / 2 ) / D12
T = ONE / ( D11*D22-ONE )
D12 = T / D12
DO 50 J = K - 2, 1, -1
WKM1 = D12*( D11*AP( J+( K-2 )*( K-1 ) / 2 )- &
& AP( J+( K-1 )*K / 2 ) )
WK = D12*( D22*AP( J+( K-1 )*K / 2 )- &
& AP( J+( K-2 )*( K-1 ) / 2 ) )
DO 40 I = J, 1, -1
AP( I+( J-1 )*J / 2 ) = AP( I+( J-1 )*J / 2 ) - &
& AP( I+( K-1 )*K / 2 )*WK - &
& AP( I+( K-2 )*( K-1 ) / 2 )*WKM1
40 CONTINUE
AP( J+( K-1 )*K / 2 ) = WK
AP( J+( K-2 )*( K-1 ) / 2 ) = WKM1
50 CONTINUE
END IF
END IF
END IF
IF( KSTEP.EQ.1 ) THEN
IPIV( K ) = KP
ELSE
IPIV( K ) = -KP
IPIV( K-1 ) = -KP
END IF
K = K - KSTEP
KC = KNC - K
GO TO 10
ELSE
K = 1
KC = 1
NPP = N*( N+1 ) / 2
60 CONTINUE
KNC = KC
IF( K.GT.N ) GO TO 110
KSTEP = 1
ABSAKK = ABS( AP( KC ) )
IF( K.LT.N ) THEN
IMAX = K + IDAMAX( N-K, AP( KC+1 ), 1 )
COLMAX = ABS( AP( KC+IMAX-K ) )
ELSE
COLMAX = ZERO
END IF
IF( MAX( ABSAKK, COLMAX ).EQ.ZERO ) THEN
IF( INFO.EQ.0 ) INFO = K
KP = K
ELSE
IF( ABSAKK.GE.ALPHA*COLMAX ) THEN
KP = K
ELSE
ROWMAX = ZERO
KX = KC + IMAX - K
DO 70 J = K, IMAX - 1
IF( ABS( AP( KX ) ).GT.ROWMAX ) THEN
ROWMAX = ABS( AP( KX ) )
JMAX = J
END IF
KX = KX + N - J
70 CONTINUE
KPC = NPP - ( N-IMAX+1 )*( N-IMAX+2 ) / 2 + 1
IF( IMAX.LT.N ) THEN
JMAX = IMAX + IDAMAX( N-IMAX, AP( KPC+1 ), 1 )
ROWMAX = MAX( ROWMAX, ABS( AP( KPC+JMAX-IMAX ) ) )
END IF
IF( ABSAKK.GE.ALPHA*COLMAX*( COLMAX / ROWMAX ) ) THEN
KP = K
ELSE IF( ABS( AP( KPC ) ).GE.ALPHA*ROWMAX ) THEN
KP = IMAX
ELSE
KP = IMAX
KSTEP = 2
END IF
END IF
KK = K + KSTEP - 1
IF( KSTEP.EQ.2 ) KNC = KNC + N - K + 1
IF( KP.NE.KK ) THEN
IF( KP.LT.N ) CALL DSWAP( N-KP, AP( KNC+KP-KK+1 ), 1, AP( KPC+1 ),1)
KX = KNC + KP - KK
DO 80 J = KK + 1, KP - 1
KX = KX + N - J + 1
T = AP( KNC+J-KK )
AP( KNC+J-KK ) = AP( KX )
AP( KX ) = T
80 CONTINUE
T = AP( KNC )
AP( KNC ) = AP( KPC )
AP( KPC ) = T
IF( KSTEP.EQ.2 ) THEN
T = AP( KC+1 )
AP( KC+1 ) = AP( KC+KP-K )
AP( KC+KP-K ) = T
END IF
END IF
IF( KSTEP.EQ.1 ) THEN
IF( K.LT.N ) THEN
R1 = ONE / AP( KC )
CALL DSPR( UPLO, N-K, -R1, AP( KC+1 ), 1, AP( KC+N-K+1 ) )
CALL DSCAL( N-K, R1, AP( KC+1 ), 1 )
END IF
ELSE
IF( K.LT.N-1 ) THEN
D21 = AP( K+1+( K-1 )*( 2*N-K ) / 2 )
D11 = AP( K+1+K*( 2*N-K-1 ) / 2 ) / D21
D22 = AP( K+( K-1 )*( 2*N-K ) / 2 ) / D21
T = ONE / ( D11*D22-ONE )
D21 = T / D21
DO 100 J = K + 2, N
WK = D21*( D11*AP( J+( K-1 )*( 2*N-K ) / 2 )- AP( J+K*( 2*N-K-1 ) / 2 ) )
WKP1 = D21*( D22*AP( J+K*( 2*N-K-1 ) / 2 )- AP( J+( K-1 )*( 2*N-K ) / 2 ) )
DO 90 I = J, N
AP( I+( J-1 )*( 2*N-J ) / 2 ) = AP( I+( J-1 )* &
& ( 2*N-J ) / 2 ) - AP( I+( K-1 )*( 2*N-K ) / &
& 2 )*WK - AP( I+K*( 2*N-K-1 ) / 2 )*WKP1
90 CONTINUE
AP( J+( K-1 )*( 2*N-K ) / 2 ) = WK
AP( J+K*( 2*N-K-1 ) / 2 ) = WKP1
100 CONTINUE
END IF
END IF
END IF
IF( KSTEP.EQ.1 ) THEN
IPIV( K ) = KP
ELSE
IPIV( K ) = -KP
IPIV( K+1 ) = -KP
END IF
K = K + KSTEP
KC = KNC + N - K + 2
GO TO 60
END IF
110 CONTINUE
RETURN
END
SUBROUTINE DSPTRI( UPLO, N, AP, IPIV, WORK, INFO )
CHARACTER UPLO
INTEGER INFO, N
INTEGER IPIV( * )
DOUBLE PRECISION AP( * ), WORK( * )
DOUBLE PRECISION ONE, ZERO
PARAMETER ( ONE = 1.0D+0, ZERO = 0.0D+0 )
LOGICAL UPPER
INTEGER J, K, KC, KCNEXT, KP, KPC, KSTEP, KX, NPP
DOUBLE PRECISION AK, AKKP1, AKP1, D, T, TEMP
LOGICAL LSAME
DOUBLE PRECISION DDOT
EXTERNAL LSAME, DDOT
EXTERNAL DCOPY, DSPMV, DSWAP, XERBLA
INTRINSIC ABS
INFO = 0
UPPER = LSAME( UPLO, 'U' )
IF( .NOT.UPPER .AND. .NOT.LSAME( UPLO, 'L' ) ) THEN
INFO = -1
ELSE IF( N.LT.0 ) THEN
INFO = -2
END IF
IF( INFO.NE.0 ) THEN
CALL XERBLA( 'DSPTRI', -INFO )
RETURN
END IF
IF( N.EQ.0 ) RETURN
IF( UPPER ) THEN
KP = N*( N+1 ) / 2
DO 10 INFO = N, 1, -1
IF( IPIV( INFO ).GT.0 .AND. AP( KP ).EQ.ZERO ) RETURN
KP = KP - INFO
10 CONTINUE
ELSE
KP = 1
DO 20 INFO = 1, N
IF( IPIV( INFO ).GT.0 .AND. AP( KP ).EQ.ZERO ) RETURN
KP = KP + N - INFO + 1
20 CONTINUE
END IF
INFO = 0
IF( UPPER ) THEN
K = 1
KC = 1
30 CONTINUE
IF( K.GT.N ) GO TO 50
KCNEXT = KC + K
IF( IPIV( K ).GT.0 ) THEN
AP( KC+K-1 ) = ONE / AP( KC+K-1 )
IF( K.GT.1 ) THEN
CALL DCOPY( K-1, AP( KC ), 1, WORK, 1 )
CALL DSPMV( UPLO, K-1, -ONE, AP, WORK, 1, ZERO, AP( KC ),1)
AP( KC+K-1 ) = AP( KC+K-1 ) - DDOT( K-1, WORK, 1, AP( KC ), 1 )
END IF
KSTEP = 1
ELSE
T = ABS( AP( KCNEXT+K-1 ) )
AK = AP( KC+K-1 ) / T
AKP1 = AP( KCNEXT+K ) / T
AKKP1 = AP( KCNEXT+K-1 ) / T
D = T*( AK*AKP1-ONE )
AP( KC+K-1 ) = AKP1 / D
AP( KCNEXT+K ) = AK / D
AP( KCNEXT+K-1 ) = -AKKP1 / D
IF( K.GT.1 ) THEN
CALL DCOPY( K-1, AP( KC ), 1, WORK, 1 )
CALL DSPMV( UPLO, K-1, -ONE, AP, WORK, 1, ZERO, AP( KC ),1)
AP( KC+K-1 ) = AP( KC+K-1 ) - DDOT( K-1, WORK, 1, AP( KC ), 1 )
AP( KCNEXT+K-1 ) = AP( KCNEXT+K-1 ) - DDOT( K-1, AP( KC ), 1, AP( KCNEXT ),1)
CALL DCOPY( K-1, AP( KCNEXT ), 1, WORK, 1 )
CALL DSPMV( UPLO, K-1, -ONE, AP, WORK, 1, ZERO, AP( KCNEXT ), 1 )
AP( KCNEXT+K ) = AP( KCNEXT+K ) - DDOT( K-1, WORK, 1, AP( KCNEXT ), 1 )
END IF
KSTEP = 2
KCNEXT = KCNEXT + K + 1
END IF
KP = ABS( IPIV( K ) )
IF( KP.NE.K ) THEN
KPC = ( KP-1 )*KP / 2 + 1
CALL DSWAP( KP-1, AP( KC ), 1, AP( KPC ), 1 )
KX = KPC + KP - 1
DO 40 J = KP + 1, K - 1
KX = KX + J - 1
TEMP = AP( KC+J-1 )
AP( KC+J-1 ) = AP( KX )
AP( KX ) = TEMP
40 CONTINUE
TEMP = AP( KC+K-1 )
AP( KC+K-1 ) = AP( KPC+KP-1 )
AP( KPC+KP-1 ) = TEMP
IF( KSTEP.EQ.2 ) THEN
TEMP = AP( KC+K+K-1 )
AP( KC+K+K-1 ) = AP( KC+K+KP-1 )
AP( KC+K+KP-1 ) = TEMP
END IF
END IF
K = K + KSTEP
KC = KCNEXT
GO TO 30
50 CONTINUE
ELSE
NPP = N*( N+1 ) / 2
K = N
KC = NPP
60 CONTINUE
IF( K.LT.1 ) GO TO 80
KCNEXT = KC - ( N-K+2 )
IF( IPIV( K ).GT.0 ) THEN
AP( KC ) = ONE / AP( KC )
IF( K.LT.N ) THEN
CALL DCOPY( N-K, AP( KC+1 ), 1, WORK, 1 )
CALL DSPMV( UPLO, N-K, -ONE, AP( KC+N-K+1 ), WORK, 1, ZERO, AP( KC+1 ), 1 )
AP( KC ) = AP( KC ) - DDOT( N-K, WORK, 1, AP( KC+1 ), 1 )
END IF
KSTEP = 1
ELSE
T = ABS( AP( KCNEXT+1 ) )
AK = AP( KCNEXT ) / T
AKP1 = AP( KC ) / T
AKKP1 = AP( KCNEXT+1 ) / T
D = T*( AK*AKP1-ONE )
AP( KCNEXT ) = AKP1 / D
AP( KC ) = AK / D
AP( KCNEXT+1 ) = -AKKP1 / D
IF( K.LT.N ) THEN
CALL DCOPY( N-K, AP( KC+1 ), 1, WORK, 1 )
CALL DSPMV( UPLO, N-K, -ONE, AP( KC+( N-K+1 ) ), WORK, 1, ZERO, AP( KC+1 ), 1 )
AP( KC ) = AP( KC ) - DDOT( N-K, WORK, 1, AP( KC+1 ), 1 )
AP( KCNEXT+1 ) = AP( KCNEXT+1 ) - DDOT( N-K, AP( KC+1 ), 1,AP( KCNEXT+2 ), 1 )
CALL DCOPY( N-K, AP( KCNEXT+2 ), 1, WORK, 1 )
CALL DSPMV( UPLO, N-K, -ONE, AP( KC+( N-K+1 ) ), WORK, 1, ZERO, AP( KCNEXT+2 ), 1 )
AP( KCNEXT ) = AP( KCNEXT ) - DDOT( N-K, WORK, 1, AP( KCNEXT+2 ), 1 )
END IF
KSTEP = 2
KCNEXT = KCNEXT - ( N-K+3 )
END IF
KP = ABS( IPIV( K ) )
IF( KP.NE.K ) THEN
KPC = NPP - ( N-KP+1 )*( N-KP+2 ) / 2 + 1
IF( KP.LT.N ) CALL DSWAP( N-KP, AP( KC+KP-K+1 ), 1, AP( KPC+1 ), 1 )
KX = KC + KP - K
DO 70 J = K + 1, KP - 1
KX = KX + N - J + 1
TEMP = AP( KC+J-K )
AP( KC+J-K ) = AP( KX )
AP( KX ) = TEMP
70 CONTINUE
TEMP = AP( KC )
AP( KC ) = AP( KPC )
AP( KPC ) = TEMP
IF( KSTEP.EQ.2 ) THEN
TEMP = AP( KC-N+K-1 )
AP( KC-N+K-1 ) = AP( KC-N+KP-1 )
AP( KC-N+KP-1 ) = TEMP
END IF
END IF
K = K - KSTEP
KC = KCNEXT
GO TO 60
80 CONTINUE
END IF
RETURN
END
SUBROUTINE XERBLA(SRNAME,INFO)
INTEGER INFO
CHARACTER*6 SRNAME
WRITE (*,FMT=9999) SRNAME,INFO
STOP
9999 FORMAT (' ** On entry to ',A6,' parameter number ',I2,' had ', &
& 'an illegal value')
END
SUBROUTINE DSPMV(UPLO,N,ALPHA,AP,X,INCX,BETA,Y,INCY)
DOUBLE PRECISION ALPHA,BETA
INTEGER INCX,INCY,N
CHARACTER UPLO
DOUBLE PRECISION AP(*),X(*),Y(*)
DOUBLE PRECISION ONE,ZERO
PARAMETER (ONE=1.0D+0,ZERO=0.0D+0)
DOUBLE PRECISION TEMP1,TEMP2
INTEGER I,INFO,IX,IY,J,JX,JY,K,KK,KX,KY
LOGICAL LSAME
EXTERNAL LSAME
EXTERNAL XERBLA
INFO = 0
IF (.NOT.LSAME(UPLO,'U') .AND. .NOT.LSAME(UPLO,'L')) THEN
INFO = 1
ELSE IF (N.LT.0) THEN
INFO = 2
ELSE IF (INCX.EQ.0) THEN
INFO = 6
ELSE IF (INCY.EQ.0) THEN
INFO = 9
END IF
IF (INFO.NE.0) THEN
CALL XERBLA('DSPMV ',INFO)
RETURN
END IF
IF ((N.EQ.0) .OR. ((ALPHA.EQ.ZERO).AND. (BETA.EQ.ONE))) RETURN
IF (INCX.GT.0) THEN
KX = 1
ELSE
KX = 1 - (N-1)*INCX
END IF
IF (INCY.GT.0) THEN
KY = 1
ELSE
KY = 1 - (N-1)*INCY
END IF
IF (BETA.NE.ONE) THEN
IF (INCY.EQ.1) THEN
IF (BETA.EQ.ZERO) THEN
DO 10 I = 1,N
Y(I) = ZERO
10 CONTINUE
ELSE
DO 20 I = 1,N
Y(I) = BETA*Y(I)
20 CONTINUE
END IF
ELSE
IY = KY
IF (BETA.EQ.ZERO) THEN
DO 30 I = 1,N
Y(IY) = ZERO
IY = IY + INCY
30 CONTINUE
ELSE
DO 40 I = 1,N
Y(IY) = BETA*Y(IY)
IY = IY + INCY
40 CONTINUE
END IF
END IF
END IF
IF (ALPHA.EQ.ZERO) RETURN
KK = 1
IF (LSAME(UPLO,'U')) THEN
IF ((INCX.EQ.1) .AND. (INCY.EQ.1)) THEN
DO 60 J = 1,N
TEMP1 = ALPHA*X(J)
TEMP2 = ZERO
K = KK
DO 50 I = 1,J - 1
Y(I) = Y(I) + TEMP1*AP(K)
TEMP2 = TEMP2 + AP(K)*X(I)
K = K + 1
50 CONTINUE
Y(J) = Y(J) + TEMP1*AP(KK+J-1) + ALPHA*TEMP2
KK = KK + J
60 CONTINUE
ELSE
JX = KX
JY = KY
DO 80 J = 1,N
TEMP1 = ALPHA*X(JX)
TEMP2 = ZERO
IX = KX
IY = KY
DO 70 K = KK,KK + J - 2
Y(IY) = Y(IY) + TEMP1*AP(K)
TEMP2 = TEMP2 + AP(K)*X(IX)
IX = IX + INCX
IY = IY + INCY
70 CONTINUE
Y(JY) = Y(JY) + TEMP1*AP(KK+J-1) + ALPHA*TEMP2
JX = JX + INCX
JY = JY + INCY
KK = KK + J
80 CONTINUE
END IF
ELSE
IF ((INCX.EQ.1) .AND. (INCY.EQ.1)) THEN
DO 100 J = 1,N
TEMP1 = ALPHA*X(J)
TEMP2 = ZERO
Y(J) = Y(J) + TEMP1*AP(KK)
K = KK + 1
DO 90 I = J + 1,N
Y(I) = Y(I) + TEMP1*AP(K)
TEMP2 = TEMP2 + AP(K)*X(I)
K = K + 1
90 CONTINUE
Y(J) = Y(J) + ALPHA*TEMP2
KK = KK + (N-J+1)
100 CONTINUE
ELSE
JX = KX
JY = KY
DO 120 J = 1,N
TEMP1 = ALPHA*X(JX)
TEMP2 = ZERO
Y(JY) = Y(JY) + TEMP1*AP(KK)
IX = JX
IY = JY
DO 110 K = KK + 1,KK + N - J
IX = IX + INCX
IY = IY + INCY
Y(IY) = Y(IY) + TEMP1*AP(K)
TEMP2 = TEMP2 + AP(K)*X(IX)
110 CONTINUE
Y(JY) = Y(JY) + ALPHA*TEMP2
JX = JX + INCX
JY = JY + INCY
KK = KK + (N-J+1)
120 CONTINUE
END IF
END IF
RETURN
END
SUBROUTINE DSWAP(N,DX,INCX,DY,INCY)
INTEGER INCX,INCY,N
DOUBLE PRECISION DX(*),DY(*)
DOUBLE PRECISION DTEMP
INTEGER I,IX,IY,M,MP1
INTRINSIC MOD
IF (N.LE.0) RETURN
IF (INCX.EQ.1 .AND. INCY.EQ.1) GO TO 20
IX = 1
IY = 1
IF (INCX.LT.0) IX = (-N+1)*INCX + 1
IF (INCY.LT.0) IY = (-N+1)*INCY + 1
DO 10 I = 1,N
DTEMP = DX(IX)
DX(IX) = DY(IY)
DY(IY) = DTEMP
IX = IX + INCX
IY = IY + INCY
10 CONTINUE
RETURN
20 M = MOD(N,3)
IF (M.EQ.0) GO TO 40
DO 30 I = 1,M
DTEMP = DX(I)
DX(I) = DY(I)
DY(I) = DTEMP
30 CONTINUE
IF (N.LT.3) RETURN
40 MP1 = M + 1
DO 50 I = MP1,N,3
DTEMP = DX(I)
DX(I) = DY(I)
DY(I) = DTEMP
DTEMP = DX(I+1)
DX(I+1) = DY(I+1)
DY(I+1) = DTEMP
DTEMP = DX(I+2)
DX(I+2) = DY(I+2)
DY(I+2) = DTEMP
50 CONTINUE
RETURN
END
SUBROUTINE DSPR(UPLO,N,ALPHA,X,INCX,AP)
DOUBLE PRECISION ALPHA
INTEGER INCX,N
CHARACTER UPLO
DOUBLE PRECISION AP(*),X(*)
DOUBLE PRECISION ZERO
PARAMETER (ZERO=0.0D+0)
DOUBLE PRECISION TEMP
INTEGER I,INFO,IX,J,JX,K,KK,KX
LOGICAL LSAME
EXTERNAL LSAME
EXTERNAL XERBLA
INFO = 0
IF (.NOT.LSAME(UPLO,'U') .AND. .NOT.LSAME(UPLO,'L')) THEN
INFO = 1
ELSE IF (N.LT.0) THEN
INFO = 2
ELSE IF (INCX.EQ.0) THEN
INFO = 5
END IF
IF (INFO.NE.0) THEN
CALL XERBLA('DSPR ',INFO)
RETURN
END IF
IF ((N.EQ.0) .OR. (ALPHA.EQ.ZERO)) RETURN
IF (INCX.LE.0) THEN
KX = 1 - (N-1)*INCX
ELSE IF (INCX.NE.1) THEN
KX = 1
END IF
KK = 1
IF (LSAME(UPLO,'U')) THEN
IF (INCX.EQ.1) THEN
DO 20 J = 1,N
IF (X(J).NE.ZERO) THEN
TEMP = ALPHA*X(J)
K = KK
DO 10 I = 1,J
AP(K) = AP(K) + X(I)*TEMP
K = K + 1
10 CONTINUE
END IF
KK = KK + J
20 CONTINUE
ELSE
JX = KX
DO 40 J = 1,N
IF (X(JX).NE.ZERO) THEN
TEMP = ALPHA*X(JX)
IX = KX
DO 30 K = KK,KK + J - 1
AP(K) = AP(K) + X(IX)*TEMP
IX = IX + INCX
30 CONTINUE
END IF
JX = JX + INCX
KK = KK + J
40 CONTINUE
END IF
ELSE
IF (INCX.EQ.1) THEN
DO 60 J = 1,N
IF (X(J).NE.ZERO) THEN
TEMP = ALPHA*X(J)
K = KK
DO 50 I = J,N
AP(K) = AP(K) + X(I)*TEMP
K = K + 1
50 CONTINUE
END IF
KK = KK + N - J + 1
60 CONTINUE
ELSE
JX = KX
DO 80 J = 1,N
IF (X(JX).NE.ZERO) THEN
TEMP = ALPHA*X(JX)
IX = JX
DO 70 K = KK,KK + N - J
AP(K) = AP(K) + X(IX)*TEMP
IX = IX + INCX
70 CONTINUE
END IF
JX = JX + INCX
KK = KK + N - J + 1
80 CONTINUE
END IF
END IF
RETURN
END
SUBROUTINE DSCAL(N,DA,DX,INCX)
DOUBLE PRECISION DA
INTEGER INCX,N
DOUBLE PRECISION DX(*)
INTEGER I,M,MP1,NINCX
INTRINSIC MOD
IF (N.LE.0 .OR. INCX.LE.0) RETURN
IF (INCX.EQ.1) GO TO 20
NINCX = N*INCX
DO 10 I = 1,NINCX,INCX
DX(I) = DA*DX(I)
10 CONTINUE
RETURN
20 M = MOD(N,5)
IF (M.EQ.0) GO TO 40
DO 30 I = 1,M
DX(I) = DA*DX(I)
30 CONTINUE
IF (N.LT.5) RETURN
40 MP1 = M + 1
DO 50 I = MP1,N,5
DX(I) = DA*DX(I)
DX(I+1) = DA*DX(I+1)
DX(I+2) = DA*DX(I+2)
DX(I+3) = DA*DX(I+3)
DX(I+4) = DA*DX(I+4)
50 CONTINUE
RETURN
END
LOGICAL FUNCTION LSAME(CA,CB)
CHARACTER CA,CB
INTRINSIC ICHAR
INTEGER INTA,INTB,ZCODE
LSAME = CA .EQ. CB
IF (LSAME) RETURN
ZCODE = ICHAR('Z')
INTA = ICHAR(CA)
INTB = ICHAR(CB)
IF (ZCODE.EQ.90 .OR. ZCODE.EQ.122) THEN
IF (INTA.GE.97 .AND. INTA.LE.122) INTA = INTA - 32
IF (INTB.GE.97 .AND. INTB.LE.122) INTB = INTB - 32
ELSE IF (ZCODE.EQ.233 .OR. ZCODE.EQ.169) THEN
IF (INTA.GE.129 .AND. INTA.LE.137 .OR. &
& INTA.GE.145 .AND. INTA.LE.153 .OR. &
& INTA.GE.162 .AND. INTA.LE.169) INTA = INTA + 64
IF (INTB.GE.129 .AND. INTB.LE.137 .OR. &
& INTB.GE.145 .AND. INTB.LE.153 .OR. &
& INTB.GE.162 .AND. INTB.LE.169) INTB = INTB + 64
ELSE IF (ZCODE.EQ.218 .OR. ZCODE.EQ.250) THEN
IF (INTA.GE.225 .AND. INTA.LE.250) INTA = INTA - 32
IF (INTB.GE.225 .AND. INTB.LE.250) INTB = INTB - 32
END IF
LSAME = INTA .EQ. INTB
END
INTEGER FUNCTION IDAMAX(N,DX,INCX)
INTEGER INCX,N
DOUBLE PRECISION DX(*)
DOUBLE PRECISION DMAX
INTEGER I,IX
INTRINSIC DABS
IDAMAX = 0
IF (N.LT.1 .OR. INCX.LE.0) RETURN
IDAMAX = 1
IF (N.EQ.1) RETURN
IF (INCX.EQ.1) GO TO 20
IX = 1
DMAX = DABS(DX(1))
IX = IX + INCX
DO 10 I = 2,N
IF (DABS(DX(IX)).LE.DMAX) GO TO 5
IDAMAX = I
DMAX = DABS(DX(IX))
5 IX = IX + INCX
10 CONTINUE
RETURN
20 DMAX = DABS(DX(1))
DO 30 I = 2,N
IF (DABS(DX(I)).LE.DMAX) GO TO 30
IDAMAX = I
DMAX = DABS(DX(I))
30 CONTINUE
RETURN
END
SUBROUTINE DCOPY (N,DX,INCX,DY,INCY)
DOUBLE PRECISION DX(1),DY(1)
IF (N.LE.0) RETURN
IF (INCX.EQ.INCY) IF (INCX-1) 10 , 30 , 70
10 CONTINUE
IX = 1
IY = 1
IF (INCX.LT.0) IX = (-N+1)*INCX+1
IF (INCY.LT.0) IY = (-N+1)*INCY+1
DO 20 I = 1,N
DY(IY) = DX(IX)
IX = IX+INCX
IY = IY+INCY
20 CONTINUE
RETURN
30 M = N-(N/7)*7
IF (M.EQ.0) GO TO 50
DO 40 I = 1,M
DY(I) = DX(I)
40 CONTINUE
IF (N.LT.7) RETURN
50 MP1 = M+1
DO 60 I = MP1,N,7
DY(I) = DX(I)
DY(I+1) = DX(I+1)
DY(I+2) = DX(I+2)
DY(I+3) = DX(I+3)
DY(I+4) = DX(I+4)
DY(I+5) = DX(I+5)
DY(I+6) = DX(I+6)
60 CONTINUE
RETURN
70 CONTINUE
NS = N*INCX
DO 80 I = 1,NS,INCX
DY(I) = DX(I)
80 CONTINUE
RETURN
END
DOUBLE PRECISION FUNCTION DDOT (N,DX,INCX,DY,INCY)
DOUBLE PRECISION DX(1),DY(1)
DDOT = 0.D0
IF (N.LE.0) RETURN
IF (INCX.EQ.INCY) IF (INCX-1) 10 , 30 , 70
10 CONTINUE
IX = 1
IY = 1
IF (INCX.LT.0) IX = (-N+1)*INCX+1
IF (INCY.LT.0) IY = (-N+1)*INCY+1
DO 20 I = 1,N
DDOT = DDOT+DX(IX)*DY(IY)
IX = IX+INCX
IY = IY+INCY
20 CONTINUE
RETURN
30 M = N-(N/5)*5
IF (M.EQ.0) GO TO 50
DO 40 I = 1,M
DDOT = DDOT+DX(I)*DY(I)
40 CONTINUE
IF (N.LT.5) RETURN
50 MP1 = M+1
DO 60 I = MP1,N,5
DDOT = DDOT+DX(I)*DY(I)+DX(I+1)*DY(I+1)+DX(I+2)*DY(I+2)+DX(I+3)&
& *DY(I+3)+DX(I+4)*DY(I+4)
60 CONTINUE
RETURN
70 CONTINUE
NS = N*INCX
DO 80 I = 1,NS,INCX
DDOT = DDOT+DX(I)*DY(I)
80 CONTINUE
RETURN
END
