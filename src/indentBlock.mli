(**************************************************************************)
(*                                                                        *)
(*  Copyright 2011 Jun Furuse                                             *)
(*  Copyright 2012,2013 OCamlPro                                          *)
(*                                                                        *)
(*  All rights reserved.  This file is distributed under the terms of     *)
(*  the GNU Public License version 3.0.                                   *)
(*                                                                        *)
(*  TypeRex is distributed in the hope that it will be useful,            *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*  GNU General Public License for more details.                          *)
(*                                                                        *)
(**************************************************************************)

(** Indenter block *)
type t

(** Shift a block by a given offset *)
val shift: t -> int -> t

(** Set the start column of the given block to [column] *)
val set_column: t -> int -> t

(** [reverse block] updates the stack to account for the original indentation,
    assumed as correct. Useful for partial indentation *)
val reverse: t -> t

(** Return the current line offset *)
val offset: t -> int

(** Return the block indentation *)
val indent: t -> int

(** Return the block original starting column *)
val original_column: t -> int

(** The empty block *)
val empty: t

(** [update t str tok] computes the new block state after processing
    the token [tok] in block [t]. The next tokens can be observed in
    the stream [str]. *)
val update : IndentConfig.t -> t -> Nstream.t -> Nstream.token -> t

(** Display stacktrace (if Config.debug is true) *)
val stacktrace: t -> unit

(** [guess_indent line block]
    For indenting empty lines: attempt to guess what the most probable
    indent at this point would be *)
val guess_indent: int -> t -> int
