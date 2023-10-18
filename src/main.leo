program notepad.aleo{

    // Define the "Message" struct.
    struct Message {
        content: field,
    }

    // Define a mapping from an index to `Message`. This will represent a user's list of messages.
    mapping MessageMap: u32 => Message;

    // Define a mapping for each user to their count of messages.
    mapping UserMessageCount: address => u32;

    // Add a new message for a user.
    transition add_message(
        public new_message: field
    ) -> Message {
        let message: Message = Message { content: new_message };
        return message then finalize(self.caller, message);
    }
    finalize add_message(user:address, message: Message){
        let current_count: u32 = Mapping::get(UserMessageCount, user);

        Mapping::set(MessageMap, current_count, message);
        Mapping::set(MessageMap, current_count, message);
        Mapping::set(UserMessageCount, user, current_count + 1u32);
    }


    // Remove a specific message for a user by index.
    transition remove_message(
        public index: u32
    ) -> u32 {
        return index then finalize(self.caller, index);
    }
    finalize remove_message(user: address, index: u32){
        let current_count: u32 = Mapping::get(UserMessageCount, user);
        if index < current_count {
            // Remove the message
            Mapping::remove(MessageMap, index);
            Mapping::set(UserMessageCount, user, current_count - 1u32);
        }
    }

    // Remove all messages for a user.
    transition clear_messages() {
        return then finalize(self.caller);
    }

    finalize clear_messages(public user: address) {
        let message_count: u32 = Mapping::get(UserMessageCount, user);
        
        for i: u32 in 0u32..15u32 {
            let exist: bool = Mapping::contains(MessageMap, i);
            if(exist){
                Mapping::remove(MessageMap, i);
            }
        }
        
        Mapping::set(UserMessageCount, user, 0u32);
    }

}
