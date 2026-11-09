! 程式名稱：sum_n
! 功能：讀入正整數 N，計算 1 + 2 + ... + N，並用公式 N(N+1)/2 交叉驗證
program sum_n
    ! 關閉隱含型別規則，所有變數都必須明確宣告
    implicit none
    ! 定義 64 位元整數的種類參數（可容納到約 9.2e18），避免 N 大時溢位
    integer, parameter :: i8 = selected_int_kind(18)
    ! n：使用者輸入的上限；i：迴圈計數；total：累加結果
    integer(i8) :: n, i, total
    ! ios：存放讀取輸入的狀態碼（0 表示成功）
    integer :: ios

    ! 顯示提示文字，advance='no' 讓游標留在同一行等待輸入
    write (*, '(A)', advance='no') '請輸入 N (正整數): '
    ! 從鍵盤讀取 n；iostat 讓讀取失敗時不會當掉，而是把錯誤碼存進 ios
    read (*, *, iostat=ios) n
    ! 若讀取失敗（例如輸入文字）或 n 小於 1，視為無效輸入
    if (ios /= 0 .or. n < 1) then
        ! 印出錯誤訊息
        write (*, '(A)') '輸入錯誤：N 必須是正整數。'
        ! 以結束碼 1 終止程式，表示異常結束
        stop 1
    end if

    ! 累加器歸零（_i8 指定常數的整數種類）
    total = 0_i8
    ! 從 1 迴圈到 n，每次 i 加 1
    do i = 1_i8, n
        ! 把目前的 i 加進累加器
        total = total + i
    end do

    ! 輸出迴圈累加的結果；I0 表示以最短寬度印出整數
    write (*, '(A,I0,A,I0)') '1 + 2 + ... + ', n, ' = ', total
    ! 輸出高斯公式 N(N+1)/2 的結果，與上一行比對以確認正確
    write (*, '(A,I0)') '公式驗證 N(N+1)/2 = ', n * (n + 1_i8) / 2_i8
! 主程式結束
end program sum_n
