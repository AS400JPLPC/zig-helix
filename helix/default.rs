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



        ":" => command_mode,
        "i" => insert_mode,

        "%" => select_all,
        "x" => extend_line_below,
        "X" => extend_line_above,
        




        "n" => search_next,
        "N" => search_prev,
        "*" => search_selection,

        ">" => indent,
        "<" => unindent,

        "esc" => normal_mode,


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
