package ru.ovk.SimNoty1C;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class NotyController {
    @Autowired
    private SimpMessagingTemplate template;

    @RequestMapping(value = "/noty/sub", method = RequestMethod.GET)
    public String notySub(@RequestParam(value = "topic", required = false, defaultValue = "1") String topic, Model model) {
        model.addAttribute("topic", topic);
        return "index";
    }

    @RequestMapping(value = "/noty/pub", method = RequestMethod.GET)
    public @ResponseBody
    String notyPub(@RequestParam(value = "topic", required = true) String topic,
                   @RequestParam(value = "message", required = true) String message) {

        template.convertAndSend("/topic/"+topic,message);

        return "0";
    }
}
