# Nobe Bank
This is a web solution that deals with the movements that a customer can make when arriving at a bank's ATM.
The system allows the user to make deposits, withdrawals and transfers in his bank account. to perform withdrawals 
and transfers the user needs to enter his password to confirm the transaction.
the system also has the possibility to generate a bank statement with all transactions carried out by the user.


### Ruby version
```
2.7.1
```

### Rails version
```
6.0.3
```

### Configuration
```shell
bundle install
yarn install
```

### Database creation
```shell
bundle exec rails db:create
bundle exec rails db:migrate
```

### How to run the test suite
```shell
bundle exec rspec
```

### Run the server
```shell
rails s
```

## Documentation

You will need an account to use the platform,
you can create an account here: `http://localhost:3000/users/sign_up`,
it requires `name`, `email` and `password`.

If you already have an account, you can sign in here: `http://localhost:3000/users/sign_in`.

After you enter your account, you will see your home page (`http://localhost:3000/`),
contains the user's account number, balance and buttons to make the transactions and statement.


Deposit:

When clicking on the deposit button, the user will be taken to a page where they can make the deposit in their bank account, where they will only have to inform the deposit amount.

Withdraw:

When clicking on the withdrawal button, the user will be taken to a page where he can make the withdrawal in his bank account, where he must inform only the withdrawal amount and the account password to confirm the withdrawal.

Transfer:

When clicking on the transfer button the user will be taken to a page where they can transfer an amount from their bank account to another registered account.
The user must inform the transfer amount, the destination account and the account password to confirm the withdrawal.

To make a transfer, the user pays a fee of 5 dollars when the transfer is made from Monday to Friday and between 9 am and 6 pm, outside those days and from that time the user must pay a fee of 7, however if the transfer amount is greater than 1000 dollars the fee will be 10 dollars

Bank Statement:

When clicking on the bank statement button the user will be taken to a page where they can check their bank statement.
The user must inform the start date and end date to filter the transactions.

Then all transactions made in the informed period are returned.

Cancel Account:

The user cannot delete his account, but he has the possibility to leave it inactive.


### Author

[Lucas Eduardo](https://www.linkedin.com/in/lucas-aaraujo/)    

