/// Pallet floor positions and payload check for straight trucks.
module palletfit;

/// A cargo box, in inches and pounds.
struct Box { double lengthIn; double widthIn; double payloadLbs; }

/// Common 26-ft box: about 312 x 96 inches inside, roughly 10,000 lb payload.
enum Box box26 = Box(312, 96, 10_000);

/// Pallets that fit on the floor (single stack), trying both orientations.
int floorPositions(Box b, double palletL = 48, double palletW = 40)
{
    int fit(double l, double w) { return cast(int)(b.lengthIn / l) * cast(int)(b.widthIn / w); }
    auto a = fit(palletL, palletW);
    auto c = fit(palletW, palletL);
    return a > c ? a : c;
}

/// True when the pallet count and average weight stay under payload.
bool underPayload(Box b, int pallets, double avgLbs)
{
    return pallets * avgLbs <= b.payloadLbs;
}

unittest
{
    assert(floorPositions(box26) == 14);
    assert(underPayload(box26, 12, 800));
    assert(!underPayload(box26, 14, 900));
}
