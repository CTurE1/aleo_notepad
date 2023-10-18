![alt text](imgs/aleo-notepad0.png "Title")

# Notepad Smart Contract on Aleo
[![Follow me on Twitter](https://img.shields.io/badge/Twitter-%231DA1F2.svg?style=for-the-badge&logo=Twitter&logoColor=white)](https://twitter.com/VadimWright)
[![Discord: @vadimwright](https://img.shields.io/badge/Discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)](@vadimwright)
[![Me on Telegram](https://img.shields.io/badge/Telegram-%235865F2.svg?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/Vadim_Wright)


Welcome to the Notepad smart contract! This contract allows users to manage messages on the Aleo blockchain. Users can add messages, remove a specific message, and even clear all their messages.

## Structure of the Contract

The smart contract primarily utilizes a struct and a few mappings to manage and manipulate user messages.

### `Message` Struct

A simple structure that encapsulates a message content.

```plaintext
struct Message {
    content: field,
}
```

### Mappings

- `MessageMap`: A mapping from an unsigned 32-bit integer to `Message`. It represents a user's list of messages.
- `UserMessageCount`: A mapping from a user address to an unsigned 32-bit integer representing the count of messages they have.

## Transitions and Finalizations

The contract employs transitions to initiate actions and finalize blocks to execute logic upon transition calls.

### Adding a Message

#### Transition: `add_message`

- **Input**: A new message as a `field`.
- **Output**: The created `Message` struct.
  
#### Finalize: `add_message`
- Stores the new message in `MessageMap` and increments `UserMessageCount`.

### Removing a Message

#### Transition: `remove_message`

- **Input**: The index of a message as an unsigned 32-bit integer.
- **Output**: The provided index.

#### Finalize: `remove_message`
- Removes the message at the specified index from `MessageMap` and decrements `UserMessageCount`.

### Clearing All Messages

#### Transition: `clear_messages`

- **No Input**.
- **No Output**.

#### Finalize: `clear_messages`
- Removes all messages of a user from `MessageMap` and sets `UserMessageCount` to 0.

## Limitations and Future Work

1. **Message Retrieval**: Current functionality does not allow message retrieval, which might be useful to implement.
   
2. **User Message Separation**: All messages are stored in a single `MessageMap` without user-separation, so managing and deleting messages might not function properly across multiple users.

3. **Clear Message Function**: The clear message function has a hardcoded loop limit (15), which may not clear all messages for a user with more messages and may need optimization.

## Contributing

Feel free to report bugs and make feature requests in the [Issue Tracker](#).
