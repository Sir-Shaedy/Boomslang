# pragma version ^0.4.1
# @license MIT

number: public(uint256)
name: public(String[64])
values: DynArray[uint256, 100]

@external
def set_number(new_number: uint256):
    self.number = new_number

@external
def increment():
    self.number += 1

@external
def set_name(new_name: String[64]):
    self.name = new_name

@external
def get_name() -> String[64]:
    return self.name

@external
def push_value(num: uint256):
    self.values.append(num)

@external
def clear_values():
    self.values = empty(DynArray[uint256, 100])

@external
def get_values() -> DynArray[uint256, 100]:
    return self.values