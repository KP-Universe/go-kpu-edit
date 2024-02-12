// Code generated by rlpgen. DO NOT EDIT.

package types

import "github.com/KP-Universe/go-kpu/rlp"
import "io"

func (obj *StateAccount) EncodeRLP(_w io.Writer) error {
	w := rlp.NewEncoderBuffer(_w)
	_tmp0 := w.List()
	w.WriteUint64(obj.Nonce)
	if obj.Balance == nil {
		w.Write(rlp.EmptyString)
	} else {
		w.WriteUint256(obj.Balance)
	}
	w.WriteBytes(obj.Root[:])
	w.WriteBytes(obj.CodeHash)
	w.ListEnd(_tmp0)
	return w.Flush()
}
