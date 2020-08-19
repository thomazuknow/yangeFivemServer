-- Account = {}
-- Account.__index = Account
-- Account = class(function(acc, balance, name)
--     acc.balance = balance
--     acc.name = name
-- end)
-- function Account:create(o, name, balance)
--     o = o or {} -- our new object
--     setmetatable(acnt, self) -- make Account handle lookup
--     self.__index = self
--     acnt.balance = balance -- initialize our object
--     actn.name = name
--     return acnt
-- end
-- function Account:withdraw(amount) self.balance = self.balance - amount end
-- function Account:setName(name) self.name = name; end
-- RegisterCommand("test3", function()
--     local acc = Account:create("konto1", 1000)
--     print(acc.name)
--     print(acc.balance)
--     acc.withdraw(100)
--     acc.setName("konto2000")
--     print(acc.balance)
-- end)
Account = {balance = 0, name = "default"}

function Account:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Account:deposit(v) self.balance = self.balance + v end

function Account:withdraw(v)
    if v > self.balance then error "insufficient funds" end
    self.balance = self.balance - v
end

RegisterCommand("test3", function()
    --Account:deposit(1000.00);
    acc = Account:new()
    print(acc.balance)
    acc:deposit(1000)
    print(acc.balance)
    print(acc.name)
    acc.name = "Konto"
    print(acc.name)

end)
