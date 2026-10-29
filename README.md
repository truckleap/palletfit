# palletfit

A small D library for a question box truck drivers get on almost every load offer: "Will 12 pallets fit, and are we over weight?"

`floorPositions` returns how many standard 48x40 pallets sit on the floor of a cargo box (it tries both orientations), and `underPayload` checks the total against the truck's payload. A typical 26-foot box with about 312 by 96 inches inside holds 14 pallets single-stacked, with roughly 10,000 lb of payload.

```d
import palletfit;

auto spots = floorPositions(box26);           // 14
auto ok = underPayload(box26, 12, 850);       // true
```

Real boxes vary: wheel wells, liftgate weight and a reefer unit all eat into space and payload, so measure your own box. For how these numbers shape which loads a straight truck should take, see [planning loads for a 26-foot box truck](https://truckleap.com/dispatch/box-truck).

MIT licensed.
