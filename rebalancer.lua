-- Portfolio Rebalancer
-- Copyright (C) 2013 Marc Lepage

print 'Portfolio Rebalancer'
print ''

dofile 'config.lua'

function round(n)
    if n < 0 then
        return math.ceil(n - 0.5)
    else
        return math.floor(n + 0.5)
    end
end

A = {} -- allocations
B = 0  -- total balance
T = {} -- trades

print 'CURRENT BALANCE'
for i = 1, #target_allocation do
    A[i] = { name=target_allocation[i][1], target_percent=target_allocation[i][2] }
    io.write(string.format('  %20s: ', A[i].name))
    A[i].current_balance = io.read('*n')
    B = B + A[i].current_balance
end
print ''

print 'TARGET BALANCE'
for i = 1, #A do
    A[i].current_percent = A[i].current_balance / B
    A[i].target_balance = A[i].target_percent * B
    A[i].target_trade = round(A[i].target_balance - A[i].current_balance)
    A[i].current_trade = 0
    print(string.format('  %20s: %7d %+7d', A[i].name, A[i].target_balance, A[i].target_trade))
end
print ''

for dst = 1, #A do
    need = A[dst].target_trade
    if 0 < need then
        for src = 1, #A do
            avail = A[src].current_trade - A[src].target_trade
            if 0 < avail then
                amt = math.min(need, avail)
                if min_trade <= amt then
                    T[#T+1] = { amt=amt, dst=dst, src=src }
                    A[src].current_trade = A[src].current_trade - amt
                    A[dst].current_trade = A[dst].current_trade + amt
                    need = need - amt
                    if need <= 1 then
                        break
                    end
                end
            end
        end
        if 1 < need then
            print('unsatisfiable!')
            os.exit(1)
        end
    end
end

print 'TRADES'
for i = 1, #T do
    print(string.format('  %20s  -->  %-20s  %d', A[T[i].src].name, A[T[i].dst].name, T[i].amt))
end
