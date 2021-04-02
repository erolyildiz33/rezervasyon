<?php
namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Contracts\Broadcasting\ShouldBroadcastNow;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
class NotificationEvent implements ShouldBroadcastNow

{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    public $baslik;
    public $mesaj;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($baslik, $mesaj)
    {
        $this->baslik = $baslik;
        $this->mesaj = $mesaj;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new Channel('channel');
    }
    public function broadcastWith()
    {
        return [
            'title' => $this->baslik,
            'message' => $this->mesaj,
        ];
    }
}
