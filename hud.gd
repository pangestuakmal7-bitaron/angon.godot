extends CanvasLayer

@onready var money_label: Label = $MoneyLabel
@onready var cow_label: Label = $CowLabel
@onready var feed_label: Label = $FeedLabel
@onready var notif_label: Label = $NotifLabel

@onready var belisapi: Button = $ActionPanel/belisapi
@onready var belipakan: Button = $ActionPanel/belipakan
@onready var tingkatkan: Button = $ActionPanel/tingkatkan
@onready var jual: Button = $ActionPanel/jual


var money: int = 1000
var cow_count: int = 0
var feed_count: int = 0
var farm_level: int = 0

func _ready() -> void:
	if belisapi:
		belisapi.pressed.connect(_on_belisapi_button_pressed)
	else:
		print("PERINGATAN: Node tombol tidak ditemukan di path tersebut!!")
	if belipakan:
		belipakan.pressed.connect(_on_belipakan_button_pressed)
	else:
		print("PERINGATAN: Tombol beli pakan tidak ditemukan di path tersebut!!")
	if tingkatkan:
		tingkatkan.pressed.connect(_on_tingkatkan_button_pressed)
	else:
		print("PERINGATAN: Tombol upgrade tidak ditemukan!!")
	if jual:
		jual.pressed.connect(_on_jual_button_pressed)
	else:
		print("PERINGATAN: Tombol jual tidak ditemukan di path tersebut!!")
	
	update_ui()
	
	notif_label.text = ""

func update_ui() -> void:
	money_label.text = "Uang: $" + str(money)
	cow_label.text = "Sapi: " + str(cow_count)
	feed_label.text = "Pakan: " + str(feed_count)
	
func show_notification(message: String) -> void:
	notif_label.text = message
	await  get_tree().create_timer(2.0).timeout
	if notif_label.text == message:
		notif_label.text = ""

#tombol beli sapi
func _on_belisapi_button_pressed() -> void:
	if money >= 100:
		money -= 100
		cow_count += 1
		update_ui()
		print("Berhasil membeli sapi: Sisa uang: ", money, " Sapi: ", cow_count)
	else:
		print("Uang tidak cukup!!!!")
		
#tombol pakan
func _on_belipakan_button_pressed() -> void:
	if money >= 20:
		money -= 20
		feed_count += 5
		update_ui()
		print("Berhasil membeli 5 pakan!!: Sisa uang:", money, " Pakan: ", feed_count)
	else:
		print("Gada duit njr")

#tombol upgrade
func _on_tingkatkan_button_pressed() -> void:
	var tingkatkan_cost = 500
	if money >= tingkatkan_cost:
		money -= tingkatkan_cost
		farm_level += 1
		update_ui()
		print("Upgrade berhasil! Level Farm naik ke " + str(farm_level))
	else:
		print("Butuh $" + str(tingkatkan_cost) + " untuk upgrade!!")
		
#tombol jual
func _on_jual_button_pressed() -> void:
	var jual_cost = 500
	if money >= jual_cost:
		money -= jual_cost
		farm_level += 1
		update_ui()
		print("Upgrade berhasil! Level Farm naik ke " + str(farm_level))
	else:
		print("Butuh $" + str(jual_cost) + " untuk upgrade!!")
		
