package funkin.objects;

class FunkinContainer extends FlxSpriteContainer {
	public var members:FlxTypedGroup<FlxSprite>;

	public function new(x:Float, y:Float, width:Float, height:Float, ?members:Array<FlxSprite>) {
		super(x, y);
		makeGraphic(width, height, 0x00000000);

		this.members = new FlxTypedGroup<FlxSprite>();
		if (members != null) for (member in members) this.members.add(member);
	}

	public override function draw() {
		this.dirty = true;
		this.pixels.fillRect(this.pixels.rect, 0);
		for (member in members.members) {
			member.dirty = true;
			this.stamp(member, member.x - member.offset.x, member.y - member.offset.y);
		}
		super.draw();
	}
}