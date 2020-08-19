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
