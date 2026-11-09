program sum_n
    implicit none
    integer, parameter :: i8 = selected_int_kind(18)
    integer(i8) :: n, i, total
    integer :: ios

    write (*, '(A)', advance='no') '請輸入 N (正整數): '
    read (*, *, iostat=ios) n
    if (ios /= 0 .or. n < 1) then
        write (*, '(A)') '輸入錯誤：N 必須是正整數。'
        stop 1
    end if

    total = 0_i8
    do i = 1_i8, n
        total = total + i
    end do

    write (*, '(A,I0,A,I0)') '1 + 2 + ... + ', n, ' = ', total
    write (*, '(A,I0)') '公式驗證 N(N+1)/2 = ', n * (n + 1_i8) / 2_i8
end program sum_n
