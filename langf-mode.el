;;
;; LangF Major Mode
;;

;; The MIT License (MIT) Copyright (c) 2016 William Ziener-Dignazio

;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use, copy,
;; modify, merge, publish, distribute, sublicense, and/or sell copies
;; of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;; Define standard mode hooks
(defvar langf-mode-hook nil)
(defvar langf-mode-map
  (make-keymap)
  "Keymap for LangF Major Mode")

(defvar langf-mode-syntax
  (let ((st (make-syntax-table)))))

(defconst langf-mode-keywords
  '("val" "if" "then" "else" "orelse" "andalso" "fun" "and" "fn" "type"
    "datatype")
  "All keywords in the LangF language. Used for font locking")

(defvar langf-font-lock-keywords
  langf-mode-keywords
  "Default highlighting expressions for LangF mode")

(define-derived-mode langf-mode prog-mode "LangF"
  (set (make-local-variable 'font-lock-defaults)
       '(langf-font-lock-keywords))
  (set (make-local-variable 'comment-start "(*"))
  (set (make-local-variable 'comment-end "*)"))
  (set (make-local-variable 'comment-start-skip) "\\(//+\\|/\\*+\\)\\s *")
  (set (make-local-variable 'comment-use-syntax) t))

;; Autoload on .lgf
(add-to-list 'auto-mode-alist '("\\.lgf\\'" . langf-mode))

(provide 'langf-mode)
