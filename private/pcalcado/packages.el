;;; packages.el --- pcalcado layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: phil <phil@ziege-2.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `pcalcado-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `pcalcado/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `pcalcado/pre-init-PACKAGE' and/or
;;   `pcalcado/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defvar pcalcado/vendor-dir (expand-file-name "private/vendor" user-emacs-directory))
(add-to-list 'load-path pcalcado/vendor-dir)
(defvar pcalcado/vendorised-packages '("emacs-tdd"))

(let ((default-directory pcalcado/vendor-dir))
  (dolist (pkg pcalcado/vendorised-packages)
    (dolist (file (directory-files (expand-file-name pkg) t ".+\\.elc?$"))
      (load-file file))))

;;vendorised libs
(dolist (project (directory-files pcalcado/vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))


(defconst pcalcado-packages
  '(go-mode
    tdd-mode)
  "The list of Lisp packages required by the pcalcado layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


;;; packages.el ends here
