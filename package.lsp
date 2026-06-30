;; PACKAGE ENTRYPOINT

(load "src/core/csv-loader.lsp")
(load "src/core/pipe-lookup.lsp")
(load "src/core/flange-lookup.lsp")
(load "src/core/bore-match.lsp")
(load "src/core/math-utils.lsp")
(load "src/core/data-utils.lsp")

(load "src/ui/dialogs.lsp")
(load "src/ui/ui-controller.lsp")

(load "src/geometry/geometry-wnrf-plan.lsp")
(load "src/geometry/geometry-wnrf-side.lsp")
(load "src/geometry/geometry-wnrf-3d.lsp")

(load "src/commands/cmd-flangegen.lsp")
(load "src/commands/cmd-wnrf150.lsp")
(load "src/commands/cmd-wnrf300.lsp")
(load "src/commands/register-commands.lsp")

(setq *pipeData* (csv:load "data/csv/ASME-PIPE-WALL-THICKNESS.csv"))
(setq *flg150*   (csv:load "data/csv/ASME-B16.5-WN-RF-150#.csv"))
(setq *flg300*   (csv:load "data/csv/ASME-B16.5-WN-RF-300#.csv"))

(princ "\nASME Flange Generator loaded. Use FLANGEGEN.")
(princ)