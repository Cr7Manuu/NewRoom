package com.tus.roomservice;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Service

public class RoomWebService {
    
	private final RoomRepository repository;

    public RoomWebService(RoomRepository repository){
        super();
        this.repository = repository;
    }

    @GetMapping("/rooms")
    public Iterable<Room> getAllRooms(){
        return this.repository.findAll();
    }

    @GetMapping("rooms/{id}")
    public Room getRoom(@PathVariable("id")long id){
        return this.repository.findById(id).get();
    }
}
