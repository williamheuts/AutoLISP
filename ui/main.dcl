flange_ui : dialog {
    label = "ASME Flange Generator";

    : row {
        : popup_list {
            key = "nps";
            label = "NPS";
        }
        : popup_list {
            key = "sch";
            label = "Schedule";
        }
        : popup_list {
            key = "class";
            label = "Class";
        }
    }

    : row {
        : button {
            key = "ok";
            label = "Generate";
            is_default = true;
        }
        : button {
            key = "cancel";
            label = "Cancel";
        }
    }
}