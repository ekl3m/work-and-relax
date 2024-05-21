package com.workrelax.workrelaxapp.chat;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ChatRepository extends JpaRepository<Chat, Long> {

    @Query("SELECT c FROM Chat c WHERE (c.OwnerID = :OwnerID AND c.CoownerID = :CoownerID) OR (c.OwnerID = :CoownerID AND c.CoownerID = :OwnerID)")
    Optional<Chat> findChatByIdPair(Long OwnerID, Long CoownerID);
}
