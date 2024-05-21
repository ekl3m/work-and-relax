package com.workrelax.workrelaxapp.chat;

import java.util.List;

import org.springframework.web.bind.annotation.RestController;

import com.workrelax.workrelaxapp.tools.Exceptions.*;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping(path = "api/v1/chat")
public class ChatController {
    private final ChatService chatService;

    @Autowired
    public ChatController(ChatService chatService) {
        this.chatService = chatService;
    }

    @GetMapping(path = "/all")
    public List<Chat> getChats(@RequestParam(name = "key", defaultValue = "") String key) throws InvalidApiKey, ApiKeyNotProvided {
        return chatService.getChats(key);
    }

    @PostMapping(path = "/new")
    public void createChat(@RequestParam(name = "key", defaultValue = "") String key, @RequestBody Chat chat)
    throws InvalidApiKey, ApiKeyNotProvided, ChatAlreadyExists {
        chatService.createChat(key, chat);
    }

    @DeleteMapping(path = "{chatId}")
    public void deleteChat(@PathVariable("chatId") Long chatId, @RequestParam(name = "key", defaultValue = "") String key) 
    throws InvalidApiKey, ApiKeyNotProvided, ChatNotFound {
        chatService.deleteChat(key, chatId);
    }

    @PutMapping(path = "/edit/{chatId}")
    public void updateChat(@PathVariable("chatId") Long chatId,
    @RequestParam(name = "key", defaultValue = "", required = true) String key, 
    @RequestParam(required = false, defaultValue = "-1") Long ownerId, 
    @RequestParam(required = false, defaultValue = "-1") Long coownerId,
    @RequestParam(required = false) List<String> messages) 
    throws InvalidApiKey, ApiKeyNotProvided, ChatAlreadyExists, ChatNotFound {
        chatService.updateChat(key, chatId, ownerId, coownerId, messages);
    }
}
