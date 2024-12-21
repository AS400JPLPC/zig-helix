use std::collections::HashMap;

use super::macros::keymap;
use super::{KeyTrie, Mode};
use helix_core::hashmap;

pub fn default() -> HashMap<Mode, KeyTrie> {
    let normal = keymap!({ "Normal mode"





        "del" => delete_char_forward,
        "up" => move_visual_line_up,
        "down" => move_visual_line_down,
        "left" => move_char_left,
        "right" => move_char_right,
        "pageup" => page_up,
        "pagedown" => page_down,
        "home" => goto_line_start,
        "end" => goto_line_end_newline,
        "ret" => insert_newline,

        "C-g" => { "Goto"
            "g" => goto_file_start,
            "e" => goto_last_line,
            "f" => goto_file,
            "h" => goto_line_start,
            "l" => goto_line_end,
            "s" => goto_first_nonwhitespace,
            "d" => goto_definition,
            "D" => goto_declaration,
            "y" => goto_type_definition,
            "r" => goto_reference,
            "i" => goto_implementation,
            "t" => goto_window_top,
            "c" => goto_window_center,
            "b" => goto_window_bottom,
            "a" => goto_last_accessed_file,
            "m" => goto_last_modified_file,
            "n" => goto_next_buffer,
            "p" => goto_previous_buffer,
            "k" => move_line_up,
            "j" => move_line_down,
            "." => goto_last_modification,
            "w" => goto_word,
        },
        ":" => command_mode,

        "i" => insert_mode,

        //"o" => open_below,
        //"O" => open_above,


        "A-d" => delete_selection,

        "A-r" => change_selection,



        "C-r" => select_regex,
        



        "%" => select_all,
        "x" => extend_line_below,
        "X" => extend_line_above,
        
        "m" => { "Match"
            "m" => match_brackets,
            "s" => surround_add,
            "r" => surround_replace,
            "d" => surround_delete,
            "a" => select_textobject_around,
            "i" => select_textobject_inner,
        },
        "[" => { "Left bracket"
            "d" => goto_prev_diag,
            "D" => goto_first_diag,
            "g" => goto_prev_change,
            "G" => goto_first_change,
            "f" => goto_prev_function,
            "t" => goto_prev_class,
            "a" => goto_prev_parameter,
            "c" => goto_prev_comment,
            "e" => goto_prev_entry,
            "T" => goto_prev_test,
            "p" => goto_prev_paragraph,
            "space" => add_newline_above,
        },
        "]" => { "Right bracket"
            "d" => goto_next_diag,
            "D" => goto_last_diag,
            "g" => goto_next_change,
            "G" => goto_last_change,
            "f" => goto_next_function,
            "t" => goto_next_class,
            "a" => goto_next_parameter,
            "c" => goto_next_comment,
            "e" => goto_next_entry,
            "T" => goto_next_test,
            "p" => goto_next_paragraph,
            "space" => add_newline_below,
        },

        "/" => search,
        "?" => rsearch,
        "n" => search_next,
        "N" => search_prev,
        "*" => search_selection,

        "u" => undo,
        "U" => redo,


        //"y" => yank_main_selection_to_clipboard,
        //"r" => replace_selections_with_clipboard,
        // move under <space>c
        "c" => toggle_comments,


        "Q" => record_macro,
        "q" => replay_macro,

        ">" => indent,
        "<" => unindent,

        "A-," => remove_primary_selection,

        // "q" => record_macro,
        // "Q" => replay_macro,


        "C-h" => hover,

        "esc" => normal_mode,


        "w" => { "Window"
            "C-w" | "w" => rotate_view,
            "C-s" | "s" => hsplit,
            "C-v" | "v" => vsplit,
            "C-t" | "t" => transpose_view,
            "f" => goto_file_hsplit,
            "F" => goto_file_vsplit,
            "C-q" | "q" => wclose,
            "C-o" | "o" => wonly,
            "C-h" | "h" | "left" => jump_view_left,
            "C-j" | "j" | "down" => jump_view_down,
            "C-k" | "k" | "up" => jump_view_up,
            "C-l" | "l" | "right" => jump_view_right,
            "L" => swap_view_right,
            "K" => swap_view_up,
            "H" => swap_view_left,
            "J" => swap_view_down,
            "n" => { "New split scratch buffer"
                "C-s" | "s" => hsplit_new,
                "C-v" | "v" => vsplit_new,
            },
        },


        "space" => { "Space"
            "F" => file_picker,
            "f" => file_picker_in_current_directory,
            "b" => buffer_picker,
            "j" => jumplist_picker,
            "s" => symbol_picker,
            "S" => workspace_symbol_picker,
            "d" => diagnostics_picker,
            "D" => workspace_diagnostics_picker,
            "g" => changed_file_picker,
            "a" => code_action,
            "'" => last_picker,
            "G" => { "Debug (experimental)" sticky=true
                "l" => dap_launch,
                "r" => dap_restart,
                "b" => dap_toggle_breakpoint,
                "c" => dap_continue,
                "h" => dap_pause,
                "i" => dap_step_in,
                "o" => dap_step_out,
                "n" => dap_next,
                "v" => dap_variables,
                "t" => dap_terminate,
                "C-c" => dap_edit_condition,
                "C-l" => dap_edit_log,
                "s" => { "Switch"
                    "t" => dap_switch_thread,
                    "f" => dap_switch_stack_frame,
                    // sl, sb
                },
                "e" => dap_enable_exceptions,
                "E" => dap_disable_exceptions,
            },
            "w" => { "Window"
                "C-w" | "w" => rotate_view,
                "C-s" | "s" => hsplit,
                "C-v" | "v" => vsplit,
                "C-t" | "t" => transpose_view,
                "f" => goto_file_hsplit,
                "F" => goto_file_vsplit,
                "C-q" | "q" => wclose,
                "C-o" | "o" => wonly,
                "C-h" | "h" | "left" => jump_view_left,
                "C-j" | "j" | "down" => jump_view_down,
                "C-k" | "k" | "up" => jump_view_up,
                "C-l" | "l" | "right" => jump_view_right,
                "H" => swap_view_left,
                "J" => swap_view_down,
                "K" => swap_view_up,
                "L" => swap_view_right,
                "n" => { "New split scratch buffer"
                    "C-s" | "s" => hsplit_new,
                    "C-v" | "v" => vsplit_new,
                },
            },
            "y" => yank_to_clipboard,
            "Y" => yank_main_selection_to_clipboard,
            "p" => paste_clipboard_after,
            "P" => paste_clipboard_before,
            "R" => replace_selections_with_clipboard,
            "/" => global_search,
            "k" => hover,
            "r" => rename_symbol,
            "h" => select_references_to_symbol_under_cursor,
            "c" => toggle_comments,
            "C" => toggle_block_comments,
            "A-c" => toggle_line_comments,
            "?" => command_palette,
        },
        "z" => { "View"
            "z" | "c" => align_view_center,
            "t" => align_view_top,
            "b" => align_view_bottom,
            "m" => align_view_middle,
            "k" | "up" => scroll_up,
            "j" | "down" => scroll_down,
            "C-b" | "pageup" => page_up,
            "C-f" | "pagedown" => page_down,
            "C-u" | "backspace" => page_cursor_half_up,
            "C-d" | "space" => page_cursor_half_down,

            "/" => search,
            "?" => rsearch,
            "n" => search_next,
            "N" => search_prev,
        },
        "Z" => { "View" sticky=true
            "z" | "c" => align_view_center,
            "t" => align_view_top,
            "b" => align_view_bottom,
            "m" => align_view_middle,
            "k" | "up" => scroll_up,
            "j" | "down" => scroll_down,
            "C-b" | "pageup" => page_up,
            "C-f" | "pagedown" => page_down,
            "C-u" | "backspace" => page_cursor_half_up,
            "C-d" | "space" => page_cursor_half_down,

            "/" => search,
            "?" => rsearch,
            "n" => search_next,
            "N" => search_prev,
        },
        "\"" => select_register,
        "|" => shell_pipe,
        "A-|" => shell_pipe_to,
        "!" => shell_insert_output,
        "A-!" => shell_append_output,
        "$" => shell_keep_pipe,
        "C-z" => suspend,

        "C-a" => increment,
        "C-x" => decrement,
    });
    let mut select = normal.clone();
    select.merge_nodes(keymap!({ "Select mode"


        "n" => extend_search_next,
        "N" => extend_search_prev,



        "home" => extend_to_line_start,
        "end" => extend_to_line_end,
        "esc" => normal_mode,


    }));
    let insert = keymap!({ "Insert mode"
        "esc" => normal_mode,

        "tab" => insert_tab,
        "S-tab" => unindent,
        "del" => delete_char_forward,
        "backspace" => delete_char_backward,
        "up" => move_visual_line_up,
        "down" => move_visual_line_down,
        "left" => move_char_left,
        "right" => move_char_right,
        "pageup" => page_up,
        "pagedown" => page_down,
        "home" => goto_line_start,
        "end" => goto_line_end_newline,
        "ret" => insert_newline,
        
    });
    hashmap!(
        Mode::Normal => normal,
        Mode::Select => select,
        Mode::Insert => insert,
    )
}
