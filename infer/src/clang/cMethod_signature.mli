(*
 * Copyright (c) 2013 - present Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *)

open! Utils

(** Define the signature of a method consisting of its name, its arguments, *)
(** return type, location and whether its an instance method.  *)

type method_signature

val ms_get_name : method_signature -> Procname.t

val ms_set_name : method_signature -> Procname.t -> unit

val ms_get_args : method_signature ->
  (string * Clang_ast_t.type_ptr) list

val ms_get_ret_type : method_signature -> Clang_ast_t.type_ptr

val ms_get_attributes : method_signature -> Clang_ast_t.attribute list

val ms_get_loc : method_signature -> Clang_ast_t.source_range

val ms_is_instance : method_signature -> bool

val ms_is_cpp_virtual : method_signature -> bool

val ms_get_lang : method_signature -> Config.clang_lang

val ms_get_pointer_to_parent : method_signature -> Clang_ast_t.pointer option

val ms_get_pointer_to_property_opt : method_signature -> Clang_ast_t.pointer option

val ms_get_return_param_typ : method_signature -> Typ.t option

val ms_is_getter : method_signature -> bool

val ms_is_setter : method_signature -> bool

val make_ms : Procname.t -> (string * Clang_ast_t.type_ptr) list -> Clang_ast_t.type_ptr
  -> Clang_ast_t.attribute list -> Clang_ast_t.source_range -> bool -> ?is_cpp_virtual:bool
  -> Config.clang_lang -> Clang_ast_t.pointer option -> Clang_ast_t.pointer option
  -> Typ.t option -> method_signature

val replace_name_ms : method_signature -> Procname.t -> method_signature

val ms_to_string : method_signature -> string
