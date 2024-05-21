package com.workrelax.workrelaxapp.chat;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workrelax.workrelaxapp.tools.Exceptions.*;
import com.workrelax.workrelaxapp.tools.ApiTools;

import jakarta.transaction.Transactional;

@Service
public class ChatService {
    private final ChatRepository chatRepository;
    ApiTools apiTools = new ApiTools();

    @Autowired
    public ChatService(ChatRepository chatRepository) {
        this.chatRepository = chatRepository;
    }

    // get all chats method + api key validation
    public List<Chat> getChats(String key) throws InvalidApiKey, ApiKeyNotProvided {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }
        return chatRepository.findAll();
    }

    public void createChat(String key, Chat chat) throws InvalidApiKey, ApiKeyNotProvided, ChatAlreadyExists {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        Optional<Chat> chatOptional = chatRepository.findChatByIdPair(chat.getOwnerID(), chat.getCoownerID());
        if(chatOptional.isPresent()) {
            throw new ChatAlreadyExists("Chat between these users already exists!");
        }
        
        chatRepository.save(chat);
    }

    public void deleteChat(String key, Long chatId) throws InvalidApiKey, ApiKeyNotProvided, ChatNotFound {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        boolean chatExists = chatRepository.existsById(chatId);
        if (!chatExists) {
            throw new ChatNotFound("Chat with ID " + chatId + " does not exist!");
        }
        chatRepository.deleteById(chatId);
    }

    @Transactional
    public void updateChat(String key, Long chatId, Long ownerId, Long coownerId, List<String> messages) 
    throws InvalidApiKey, ApiKeyNotProvided, ChatAlreadyExists, ChatNotFound {
        if (key.isEmpty()) {
            throw new ApiKeyNotProvided("API key was not provided!");
        }
        if (!apiTools.isKeyValid(key)) {
            throw new InvalidApiKey("Provided API key is incorrect!");
        }

        Chat chat = chatRepository.findById(chatId).orElseThrow(() -> new ChatNotFound("Chat with ID " + chatId + " does not exist!"));

        // Changing ownerId
        if(ownerId >= 0 && !Objects.equals(chat.getOwnerID(), ownerId)) {
            Optional<Chat> chatOptional = chatRepository.findChatByIdPair(ownerId, chat.getCoownerID());
            if (chatOptional.isPresent()) {
                throw new ChatAlreadyExists("Chat between these users already exists!");
            }

            chat.setOwnerID(ownerId);
        }

        // Changing coownerId
        if (coownerId >= 0 && !Objects.equals(chat.getCoownerID(), coownerId)) {
            Optional<Chat> chatOptional = chatRepository.findChatByIdPair(chat.getOwnerID(), coownerId);
            if (chatOptional.isPresent()) {
                throw new ChatAlreadyExists("Chat between these users already exists!");
            }

            chat.setCoownerID(coownerId);
        }

        // Changing messages
        if (messages != null && messages.isEmpty() && !Objects.equals(chat.getMessages(), messages)) {
            chat.setMessages(messages);
        }
    }
}
