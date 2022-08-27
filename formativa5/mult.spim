
multfac: 
        #   $t0 : hi (P[63..32])
        #   $t1 : lo (P[31.. 0])

        addi    $t8, $zero, 32

        # $t6 : 1 se M for negativo, zero caso contrario
        # $t7 : 1 se Q for negativo, zero caso contrario
        slt     $t6, $a0, $zero
        slt     $t7, $a1, $zero 

        beq     $t6, $zero, checkQ
        nor     $a0, $a0, $zero
        addi    $a0, $a0, 1

checkQ:
        beq     $t7, $zero, step1
        nor     $a1, $a1, $zero
        addi    $a1, $a1, 1

step1:
        #   Passos 1 e 2
        move    $t0, $zero
        move    $t1, $a1

        # Passo 3
step3:
        andi    $t3, $t1, 1 
        beq     $t3, $zero, shift
        add     $t0, $t0, $a0

        # Passo 4
shift:
       andi    $t3, $t0, 1
       srl     $t0, $t0, 1
       srl     $t1, $t1, 1 

       sll     $t3, $t3, 31
       add     $t1, $t1, $t3
       
       # Passo 5
       addi    $t8, $t8, -1
       beq     $t8, $zero, checksign
       j    step3

checksign:
       beq     $t6, $t7, finish
       nor     $t1, $t1, $zero
       nor     $t0, $t0, $zero
       addi    $t1, $t1, 1

finish:
       mthi    $t0
       mtlo    $t1
       jr      $ra
