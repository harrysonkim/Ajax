package gson;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/gson/text01")
public class GsonTestServlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/gson/text01 [GET]");
		
		//Gson객체
		Gson gson = new Gson();
		
		// ==============================
		
//		gson.toJson(자바객체) : String
		// JAVA 객체 => JSON텍스트 ( 마샬링)
		
//		gson.fromJson("JSON택스트", 자바타입T) : T
		// JSON 텍스트 => JAVA객체 (언마샬링)
		
		// ==============================

		// int형 데이터 => JSON텍스트
		System.out.println( gson.toJson(123) );
		
		// String형 데이터 => JSON텍스트
		System.out.println( gson.toJson("Apple") ); // => "\"Apple"\"
		
		// Long형 데이터 => JSON 텍스트
		System.out.println( gson.toJson( new Long(567) ) );
		
		// Long형 데이터 => JSON 텍스트
		System.out.println( gson.toJson( 789L ) ); // Long타입의 789 => but,JSON은 구분X

		// ==============================
		
		int[] arr = { 1, 2, 3, 4, 5};
		System.out.println( "자바 배열 : " + arr);
		
		// int[] => array JSON텍스트
		System.out.println( "JSON : " + gson.toJson(arr));
		
		// ==============================
		
		// map객체는 Json텍스트로 Object로 변환된다
		Map map = new HashMap();
		
		map.put("list", arr );
		
		System.out.println( gson.toJson(map) );
		
		// ==============================
		
		// Client에서 server에 insert를 수행하는 경우
		// true / false로 반환해서 성공유무를 확인하고 싶은때,
		// 아래와 같이 쌩으로 true를 보내기 보다는 
		// Map을 만들어서 Object타입으로 넣어줘야 한다
		System.out.println( gson.toJson(true) );

		Map res = new HashMap();
		res.put("result", true );
		System.out.println( res );
		
		System.out.println("================================");
		
		//////////////////////////////
		// JSON텍스트 => int 데이터 //
		//////////////////////////////
		
		// 제너릭에서는 Warper클래스타입들이 들어가야한다
		
		// fromJson메소드를 F2눌렀을때 나오는 내용..
		// <Integer> Integer com.google.gson.Gson.fromJson(String json, Class<Integer> classOfT)
		// 		throws JsonSyntaxException
		
		// 한마디로, int.Class에서 int라고 썻지만
		// 알아서, Class<Integer>는 데이터타입으로 바꿔준다
		int n1 = gson.fromJson("12345", int.class ); // Number타입의 JSON Text
		System.out.println( n1 );
		
		////////////////////////////////
		// JSON텍스트 => double데이터 //
		////////////////////////////////
		Double n2 = gson.fromJson("12345", double.class);
		System.out.println( n2 );

		//////////////////////////////
		// JSON텍스트 => Long데이터 //
		//////////////////////////////
		Long n3 = gson.fromJson("12345", Long.class);
		System.out.println( n3 );
		
		
		
		
		System.out.println("================================");

		
		
		
		
		
	}


	
	
}
