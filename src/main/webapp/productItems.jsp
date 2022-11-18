<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
      <section class="product_container" id="productList">
        <section class="product_best"></section>
        <section class="product_premium"></section>
      </section>
      <script>
const bestProducts = [
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '닭가슴살 샐러드',
	    kcal: 100,
	    pcontent: '닭가슴살로만든샐러드',
	    price: 7000,
	    discount: 10,
	    ctgno: 1,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '훈제오리샐러드',
	    price: 8500,
	    discount: 10,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '닭가슴살 볼 오리지널 100g',
	    price: 1890,
	    discount: 0,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '프로틴어스 곡물 크리스피롤 50g',
	    price: 17000,
	    discount: 10,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '프로틴어스 곡물 프로틴칩 ',
	    price: 7900,
	    discount: 10,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '소스 통 닭가슴살 매콤칠리 100g',
	    price: 1990,
	    discount: 0,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '맛있닭 닭가슴살 고백칩 오리지널 30g',
	    price: 12400,
	    discount: 10,
	    sale: true,
	    hot: false,
	  },
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '1am 그릭요거트 플레인 100g',
	    price: 11400,
	    discount: 10,
	    sale: true,
	    hot: false,
	  },
	];

	const premiumProducts = [
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '닭가슴살 샐러드',
	    kcal: 100,
	    pcontent: '귀여운 고양이',
	    price: 7000,
	    discount: 10,
	    ctgno: 1,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '크래미샐러드',
	    price: 7000,
	    discount: 10,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '치즈샐러드',
	    price: 6000,
	    discount: 10,
	    sale: true,
	    hot: false,
	  },
	  {
	    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
	    pname: '불고기샐러드',
	    price: 7500,
	    discount: 10,
	    sale: true,
	    hot: true,
	  },
	  {
		    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
		    pname: '닭가슴살비엔나샐러드',
		    kcal: 100,
		    pcontent: '귀여운 고양이',
		    price: 7500,
		    discount: 10,
		    ctgno: 1,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
		    pname: '파스타샐러드',
		    price: 7000,
		    discount: 10,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
		    pname: '훈제오리샐러드',
		    price: 8500,
		    discount: 10,
		    sale: true,
		    hot: false,
		  },
		  {
		    img: 'https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg',
		    pname: '멕시칸타코샐러드',
		    price: 9000,
		    discount: 10,
		    sale: true,
		    hot: true,
		  }
	];
	
 	 const pListSection = document.getElementById('productList');
 	 const productItem = new ProductItem(pListSection);
 	
 	function getDiscountPrice(price,discount) {
 		 const discountPrice =  price - (price * (discount/100));
 		 
 		 return parseInt(discountPrice);
 	 }
 	 
 	function ProductItem(pListSection) {
  		const bestList = pListSection.querySelector('.product_best');
  		const premiumList = pListSection.querySelector('.product_premium');

  		const updateProductFnc = (productItems, title) => {
  			const titleValue = title ? "<h2>"+title+"</h2>" : '';
  			let saleValue='';
  	  		let hotValue='';
  	  		let discountPrice = '';
  	  		let priceValue = '';
  	  		
  			const test = productItems.map((item) => {
				saleValue = item.sale ? "<span class='info_sale'>SALE</span>" : '' ;
				hotValue = item.hot ? "<span class='info_hot'>HOT</span>" : '' ;
				
				discountPrice = getDiscountPrice(item.price, item.discount);
				priceValue = item.discount ? "<span class='price_current'>" + discountPrice +"원</span><span class='price_default'>"+ item.price + "원</span>"
						: "<span class='price_current'>" + item.price +"원</span>"
				 
	
 			return "<div class='product_item'><div class='product_item_img'><img src='"+
 			item.img + "'/></div><span class='product_item_name'>" + 
 			item.pname + "</span> <div class='product_item_price'>" + priceValue + "</div><div class='product_item_info'>"+
 			saleValue + hotValue + "</div></div>"}).join('');
 				
  			return titleValue+ "<div class='product_items'>"+ test + "</div>";
  		};
  		
  		
 		const render = () => {
 			bestList.innerHTML = updateProductFnc(bestProducts, '샐러드래곤 베스트 인기상품');
 			premiumList.innerHTML = updateProductFnc(premiumProducts, '샐러드래곤 프리미엄 샐러드');
 		}
 	 render();
}
 	
</script>
</body>
</html>