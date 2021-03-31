;; EMACS X WINDOW MANAGER
(require 'exwm)
(exwm-enable)
(require 'exwm-randr)
(add-hook 'exwm-randr-screen-change-hook
          (lambda ()
            (start-process-shell-command
             "xrandr" nil "xrandr --output DP-2 --mode 3840x2160 --pos 0x0 --rotate normal")))
(exwm-randr-enable)
(require 'exwm-systemtray)
(exwm-systemtray-enable)

(setq exwm-workspace-number 10
      exwm-randr-workspace-monitor-plist '(0 "DP-2")
      exwm-input-prefix-keys '(?\M-x ?\M-:)
      ;exwm-input-simulation-keys '(([?\s-F] . [?\C-f]))
      exwm-input-global-keys '(([?\s-&] . (lambda (command)
                                          (interactive (list (read-shell-command "$ ")))
                                          (start-process-shell-command command nil command)))
                               ([?\s-r] . exwm-reset)
                               ;; splits
                               ([?\s-v] . evil-window-vsplit)
                               ([?\s-s] . evil-window-split)
                               ;; managing workspaces
                               ([?\s-w] . exwm-workspace-switch)
                               ([?\s-W] . exwm-workspace-swap)
                               ([?\s-\C-w] . exwm-workspace-move)
                               ;; essential programs
                               ([?\s-d] . dired)
                               ([s-return] . vterm)
                               ([s-S-return] . eshell)
                               ([?\s-e] . dmenu)
                               ;; killing buffers and windows
                               ([?\s-b] . ibuffer)
                               ([?\s-B] . kill-current-buffer)
                               ([?\s-C] . +workspace/close-window-or-workspace)
                               ;; change window focus with super+h,j,k,l
                               ([?\s-h] . evil-window-left)
                               ([?\s-j] . evil-window-next)
                               ([?\s-k] . evil-window-prev)
                               ([?\s-l] . evil-window-right)
                               ;; move windows around using SUPER+SHIFT+h,j,k,l
                               ([?\s-H] . +evil/window-move-left)
                               ([?\s-J] . +evil/window-move-down)
                               ([?\s-K] . +evil/window-move-up)
                               ([?\s-L] . +evil/window-move-right)
                               ;; move window to far left or far right with SUPER+CTRL+h,l
                               ([?\s-\C-h] . side-left-window)
                               ([?\s-\C-j] . side-bottom-window)
                               ([?\s-\C-k] . side-top-window)
                               ([?\s-\C-l] . side-right-window)
                               ([?\s-\C-d] . side-window-delete-all)
                               ([?\s-\C-r] . resize-window)
                               ;; switch workspace with SUPER+{0-9}
                               ([?\s-0] . (lambda () (interactive) (exwm-workspace-switch-create 0)))
                               ([?\s-1] . (lambda () (interactive) (exwm-workspace-switch-create 1)))
                               ([?\s-2] . (lambda () (interactive) (exwm-workspace-switch-create 2)))
                               ([?\s-3] . (lambda () (interactive) (exwm-workspace-switch-create 3)))
                               ([?\s-4] . (lambda () (interactive) (exwm-workspace-switch-create 4)))
                               ([?\s-5] . (lambda () (interactive) (exwm-workspace-switch-create 5)))
                               ([?\s-6] . (lambda () (interactive) (exwm-workspace-switch-create 6)))
                               ([?\s-7] . (lambda () (interactive) (exwm-workspace-switch-create 7)))
                               ([?\s-8] . (lambda () (interactive) (exwm-workspace-switch-create 8)))
                               ([?\s-9] . (lambda () (interactive) (exwm-workspace-switch-create 9)))
                               ;; move window workspace with SUPER+SHIFT+{0-9}
                               ([?\s-\)] . (lambda () (interactive) (exwm-workspace-move-window 0)))
                               ([?\s-!] . (lambda () (interactive) (exwm-workspace-move-window 1)))
                               ([?\s-@] . (lambda () (interactive) (exwm-workspace-move-window 2)))
                               ([?\s-#] . (lambda () (interactive) (exwm-workspace-move-window 3)))
                               ([?\s-$] . (lambda () (interactive) (exwm-workspace-move-window 4)))
                               ([?\s-%] . (lambda () (interactive) (exwm-workspace-move-window 5)))
                               ([?\s-^] . (lambda () (interactive) (exwm-workspace-move-window 6)))
                               ([?\s-&] . (lambda () (interactive) (exwm-workspace-move-window 7)))
                               ([?\s-*] . (lambda () (interactive) (exwm-workspace-move-window 8)))
                               ([?\s-\(] . (lambda () (interactive) (exwm-workspace-move-window 9)))
                               ;; setting some toggle commands
                               ([?\s-f] . exwm-floating-toggle-floating)
                               ([?\s-m] . exwm-layout-toggle-mode-line)
                               ([f11] . exwm-layout-toggle-fullscreen)
                               ;; softwares
                               ([?\s-u] . (lambda () (interactive) (start-process "chromium" nil "chromium")))
                               ([?\s-g] . (lambda () (interactive) (start-process "discord" nil "discord")))
                               ([?\s-G] . (lambda () (interactive) (start-process "thunderbird" nil "thunderbird")))
                               ))
