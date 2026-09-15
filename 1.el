
;; (find-esvg "esvg-append.el")
;; (find-esvg "esvg-show.el")
;; (find-esvg "esvg-eepitch.el")
;; (find-esvg "esvg-build.el")
;; (find-esvg "esvg-demos.el")
;; (find-esvg "esvg-xy.el")

(defun _esvg-arrow/theta (x0 y0 l1x l1y) (atan (- l1y y0) (- l1x x0)))
; (_esvg-arrow/theta 0 0 10 10)

(defun _esvg-arrow/p1    (l1x l1y dx dy theta)
  (cons (- l1x (   * dx (cos theta))  (* dy (sin theta)))
        (+ l1y (- (* dx (sin theta))) (* dy (cos theta)))))

(defun _esvg-arrow/p1    (l1x l1y dx dy theta)
  (let* ((c (cos theta))
	 (s (sin theta)))
    (cons (- l1x    (* dx c)  (* dy s))
          (+ l1y (- (* dx s)) (* dy c))))
;      (_esvg-arrow/p1 10 10 2 2 (_esvg-arrow/theta 0 0 10 10))
; (car (_esvg-arrow/p1 10 10 2 2 (_esvg-arrow/theta 0 0 10 10)))
; (cdr (_esvg-arrow/p1 10 10 2 2 (_esvg-arrow/theta 0 0 10 10)))

(defun _esvg-arrow/p2    (l1x l1y dx dy theta)
    (cons (+ (- l1x (* dx (cos theta))) (* dy (sin theta)))
             (- l1y (* dx (sin theta)) (* dy (cos theta)))))
;      (_esvg-arrow/p2 10 10 2 2 (_esvg-arrow/theta 0 0 10 10))
; (car (_esvg-arrow/p2 10 10 2 2 (_esvg-arrow/theta 0 0 10 10)))
; (cdr (_esvg-arrow/p2 10 10 2 2 (_esvg-arrow/theta 0 0 10 10)))


'("This is a test block for `eepitch-svg'! Use <f9>s!"

 (load-esvg)  ; (find-angg ".emacs" "load-esvg")
  (defun d (&rest r) (show-svg))            ; display
  (defun st   (o)    (setq svg   o))        ; set top-level svg
  (defun sa   (o)    (setq svg-a o))        ; set where appends happen
  (defun sta  (o)    (setq svg o svg-a o))  ; set top-level and append
  (defun a    (o)    (esvg-append svg-a o)) ; append
  (defun ad   (o)    (a o) (d))             ; append and display
  (defun asad (o)    (a o) (sa o) (d))      ; append, set append, display

  (d (sta (esvg-sbgat  0 0  4 3  500 nil)))


(sta (svg-create          500 500 :stroke "black" :stroke-width 1))
(ad  (esvg-rectangle 0 0  500 500 :fill "white"))
(let ((dx 10) (dy  5) (x0 0) (y0 0) (x1 250) (y1 250)
      (p1x (car (_esvg-arrow/p1 x1 y1 dx dy (_esvg-arrow/theta x0 y0 x1 y1))))
      (p1y (cdr (_esvg-arrow/p1 x1 y1 dx dy (_esvg-arrow/theta x0 y0 x1 y1)))))
      (p2x (car (_esvg-arrow/p2 x1 y1 dx dy (_esvg-arrow/theta x0 y0 x1 y1)))))
      (p2y (cdr (_esvg-arrow/p2 x1 y1 dx dy (_esvg-arrow/theta x0 y0 x1 y1)))))
 (ad (esvg-line x0 x0 x1 y1))
 (ad (esvg-line       x1 y1 p1x p1y))
 (ad (esvg-line       x1 y1 p2x p2y))
)




"--")
