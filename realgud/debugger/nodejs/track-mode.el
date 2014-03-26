;;; Copyright (C) 2014 Rocky Bernstein <rocky@gnu.org>
;;; nodejs tracking a comint buffer.

(eval-when-compile (require 'cl))
(require 'load-relative)
(require-relative-list '(
			 "../../common/cmds"
			 "../../common/menu"
			 "../../common/track"
			 "../../common/track-mode"
			 )
		       "realgud-")
(require-relative-list '("core" "init") "realgud-nodejs-")

(declare-function realgud-track-set-debugger 'realgud-track-mode)
(declare-function realgud-track-mode-setup   'realgud-track-mode)

(realgud-track-mode-vars "nodejs")

(declare-function realgud-track-mode(bool))

(defun nodejs-track-mode-hook()
  (if nodejs-track-mode
      (progn
	(use-local-map nodejs-track-mode-map)
	(message "using nodejs mode map")
	)
    (message "nodejs track-mode-hook disable called"))
)

(define-minor-mode realgud-nodejs-track-mode
  "Minor mode for tracking nodejs source locations inside a nodejs shell via realgud.

If called interactively with no prefix argument, the mode is toggled. A prefix argument, captured as ARG, enables the mode if the argument is positive, and disables it otherwise.

\\{nodejs-track-mode-map}"
  :init-value nil
  ;; :lighter " nodejs"   ;; mode-line indicator from realgud-track is sufficient.
  ;; The minor mode bindings.
  :global nil
  :group 'nodejs

  :keymap nodejs-track-mode-map

  (realgud-track-set-debugger "nodejs")
  (if realgud-nodejs-track-mode
      (progn
        (realgud-track-mode-setup 't)
        (nodejs-track-mode-hook))
    (progn
      (setq realgud-track-mode nil)
      ))
)

;; ;; Debugger commands that nodejs doesn't have
;; (define-key nodejs-track-mode-map
;;   [remap realgud-cmd-newer-frame] 'undefined)
;; (define-key nodejs-track-mode-map
;;   [remap realgud-cmd-older-frame] 'undefined)
(define-key nodejs-short-key-mode-map
  [remap realgud-cmd-step] 'realgud-cmd-step-no-arg)
(define-key nodejs-short-key-mode-map
  [remap realgud-cmd-step] 'realgud-cmd-step-no-arg)
(define-key nodejs-short-key-mode-map
  [remap realgud-cmd-next] 'realgud-cmd-next-no-arg)

(provide-me "realgud-nodejs-")