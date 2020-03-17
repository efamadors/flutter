import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screnSize = MediaQuery.of(context).size;
 
    return Container(
      padding: EdgeInsets.only(top: 2),
      child: Swiper(
        itemWidth: _screnSize.width * 0.7,
        itemHeight: _screnSize.height * 0.5,
        layout: SwiperLayout.STACK,
        itemCount: peliculas.length,
        itemBuilder: (BuildContext context, int index) {

          peliculas[index].uniqueId = '${peliculas[index].id}-tarjetas';

          return Hero(
            tag: peliculas[index].uniqueId,
                      child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GestureDetector(
                                  child: FadeInImage(
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    image: NetworkImage(peliculas[index].getPosterImg()),
                    fit: BoxFit.cover,
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, 'detalle', arguments: peliculas[index]);
                  },
                ),
              ),
          );
        },
      ),
    );
  }
}
